<?php
require_once __DIR__ . '/../modele/myParam.inc.php';
require_once __DIR__ . '/../modele/serie.php';
require_once __DIR__ . '/../modele/serieBDD.php';

class SerieController {
    public function series() {
        $series = getListeSeries();
        require __DIR__ . '/../vue/listeSerie.php';
    }

    public function serie() {
        $id = isset($_GET['id']) ? (int)$_GET['id'] : 0;
        if ($id <= 0) { header('Location: index.php?action=series'); exit; }
        $serie = getSerieById($id);
        if ($serie == null) { http_response_code(404); echo "Série introuvable."; exit; }
        
        $heroImage = $serie['image'] ?? 'https://via.placeholder.com/1200x800.png?text=Pas+d%27image';
        if ((int)($serie['id_serie'] ?? 0) == 1) {
            $heroImage = 'https://images5.alphacoders.com/638/thumb-1920-638721.jpg';
        }
        $createur = trim(($serie['createur_prenom'] ?? '') . ' ' . ($serie['createur_nom'] ?? ''));
        $musique  = trim((string)($serie['musique_titre'] ?? ''));
        if (!empty($serie['musique_groupe'])) $musique .= ' par ' . $serie['musique_groupe'];
        
        require __DIR__ . '/../vue/serie.php';
    }

    public function saisons() {
        $id     = isset($_GET['id']) ? (int)$_GET['id'] : 0;
        $saison = isset($_GET['saison']) ? (int)$_GET['saison'] : 1;
        if ($id <= 0) { header('Location: index.php?action=series'); exit; }
        if ($saison <= 0) { $saison = 1; }
        
        $pdo = getConnexion();
        $stmt = $pdo->prepare('SELECT titre_fr, image FROM annexe1Vue WHERE id_serie = :id');
        $stmt->execute(['id' => $id]);
        $serie = $stmt->fetch(PDO::FETCH_ASSOC);
        if (!$serie) { exit('Série introuvable.'); }
        
        $stmt = $pdo->prepare('SELECT DISTINCT num_saison, nb_episodes FROM annexe3Vue WHERE titre_serie = :titre ORDER BY num_saison ASC');
        $stmt->execute(['titre' => $serie['titre_fr']]);
        $saisons = $stmt->fetchAll(PDO::FETCH_ASSOC);
        if (empty($saisons)) { exit('Aucune saison.'); }
        
        $allowed = array_map(fn($r) => (int)$r['num_saison'], $saisons);
        if (!in_array($saison, $allowed, true)) { $saison = (int)$saisons[0]['num_saison']; }
        $episodeIllustration = 'https://www.topkool.com/fr/wp-content/uploads/2012/11/docteur-house-062.jpg';
        
        $stmt = $pdo->prepare('SELECT DISTINCT producteur_nom, producteur_prenom FROM annexe3Vue WHERE titre_serie = :titre AND num_saison = :s');
        $stmt->execute(['titre' => $serie['titre_fr'], 's' => $saison]);
        $prods = [];
        foreach ($stmt->fetchAll(PDO::FETCH_ASSOC) as $r) {
            if ($n = trim(($r['producteur_prenom'] ?? '') . ' ' . ($r['producteur_nom'] ?? ''))) $prods[] = $n;
        }
        
        $stmt = $pdo->prepare(
            'SELECT DISTINCT ON (num_episode)
                    num_saison, nb_episodes, date_debut_tournage, date_fin_tournage,
                    num_episode, episode_titre_original, episode_titre_fr, episode_resume
             FROM annexe3Vue
             WHERE titre_serie = :titre AND num_saison = :s
             ORDER BY num_episode ASC'
        );
        $stmt->execute(['titre' => $serie['titre_fr'], 's' => $saison]);
        $rows   = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $header = $rows[0] ?? null;
        
        require __DIR__ . '/../vue/saisons.php';
    }

    public function episode() {
        $id      = isset($_GET['id']) ? (int)$_GET['id'] : 0;
        $saison  = isset($_GET['saison']) ? (int)$_GET['saison'] : 0;
        $episode = isset($_GET['episode']) ? (int)$_GET['episode'] : 0;
        if ($id <= 0 || $saison <= 0 || $episode <= 0) { header("Location: index.php?action=saisons&id=$id"); exit; }
        
        $pdo = getConnexion();
        $stmt = $pdo->prepare('SELECT titre_fr, image FROM annexe1Vue WHERE id_serie = :id');
        $stmt->execute(['id' => $id]);
        $serie = $stmt->fetch(PDO::FETCH_ASSOC);
        if (!$serie) exit('Série introuvable.');
        
        $stmt = $pdo->prepare(
            'SELECT titre_serie, num_saison, num_episode, titre_original, titre_fr_episode, date_diff_fr, date_diff_origine, resume,
                    scenariste_nom, scenariste_prenom, realisateur_nom, realisateur_prenom, guest_star_nom, guest_star_prenom, guest_star_personnage
             FROM annexe4Vue WHERE titre_serie = :titre AND num_saison = :saison AND num_episode = :episode'
        );
        $stmt->execute(['titre' => $serie['titre_fr'], 'saison' => $saison, 'episode' => $episode]);
        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
        if (empty($rows)) { echo "<p>Episode introuvable.</p>"; exit; }
        
        $episodeIllustration = 'https://www.topkool.com/fr/wp-content/uploads/2012/11/docteur-house-062.jpg';
        $ep = $rows[0];
        $scenaristes = []; $realisateurs = []; $guestStars = [];
        
        foreach ($rows as $r) {
            if ($sc = trim(($r['scenariste_prenom'] ?? '') . ' ' . ($r['scenariste_nom'] ?? '')))
                if (!in_array($sc, $scenaristes)) $scenaristes[] = $sc;
            if ($re = trim(($r['realisateur_prenom'] ?? '') . ' ' . ($r['realisateur_nom'] ?? '')))
                if (!in_array($re, $realisateurs)) $realisateurs[] = $re;
            if ($guest = trim(($r['guest_star_prenom'] ?? '') . ' ' . ($r['guest_star_nom'] ?? ''))) {
                $role = trim((string)($r['guest_star_personnage'] ?? ''));
                $line = $role ? "$guest (en $role)" : $guest;
                if (!in_array($line, $guestStars)) $guestStars[] = $line;
            }
        }
        require __DIR__ . '/../vue/episode.php';
    }

    public function personnages() {
        $id      = isset($_GET['id']) ? (int)$_GET['id'] : 0;
        $saison  = isset($_GET['saison']) ? (int)$_GET['saison'] : 0;
        $episode = isset($_GET['episode']) ? (int)$_GET['episode'] : 0;
        if ($id <= 0 || $saison <= 0 || $episode <= 0) { header("Location: index.php?action=saisons&id=$id"); exit; }
        
        $pdo = getConnexion();
        $stmt = $pdo->prepare('SELECT titre_fr FROM annexe1Vue WHERE id_serie = :id');
        $stmt->execute(['id' => $id]);
        $serie = $stmt->fetch(PDO::FETCH_ASSOC);
        if (!$serie) exit('Série introuvable.');
        
        $stmt = $pdo->prepare(
            'SELECT nom_personnage, position, description, acteur_nom, acteur_prenom, doubleur_nom, doubleur_prenom
             FROM annexe5Vue WHERE titre_serie = :titre AND num_saison = :saison AND num_episode = :episode'
        );
        $stmt->execute(['titre' => $serie['titre_fr'], 'saison' => $saison, 'episode' => $episode]);
        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
        
        $persos = [];
        foreach ($rows as $r) {
            $name = $r['nom_personnage'] ?? '';
            if (!$name) continue;
            if (!isset($persos[$name])) {
                $persos[$name] = [
                    'nom'      => $name, 'desc' => $r['description'] ?? '', 'positions' => [],
                    'acteur'   => trim(($r['acteur_prenom'] ?? '') . ' ' . ($r['acteur_nom'] ?? '')),
                    'doubleur' => trim(($r['doubleur_prenom'] ?? '') . ' ' . ($r['doubleur_nom'] ?? ''))
                ];
            }
            if ($r['position'] && !in_array($r['position'], $persos[$name]['positions'])) {
                $persos[$name]['positions'][] = $r['position'];
            }
        }
        ksort($persos);
        require __DIR__ . '/../vue/personnages.php';
    }
}