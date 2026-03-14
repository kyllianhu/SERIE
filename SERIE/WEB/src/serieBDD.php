<?php
require_once "myParam.inc.php";
require_once "serie.php";

// Retourne la liste de toutes les séries (id, titre, image)
function getListeSeries(): array {
    $pdo = getConnexion();
    $sql = "SELECT DISTINCT id_serie, titre_fr, image
            FROM annexe1Vue
            ORDER BY titre_fr ASC";
    $stmt = $pdo->prepare($sql);
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

// Retourne toutes les informations d'une série par son identifiant, ou null si introuvable
function getSerieById(int $id): ?array {
    $pdo = getConnexion();

    // Informations de base depuis la vue (image + titre)
    $stmt = $pdo->prepare('SELECT id_serie, titre_fr, image FROM annexe1Vue WHERE id_serie = :id');
    $stmt->execute(['id' => $id]);
    $base = $stmt->fetch(PDO::FETCH_ASSOC);
    if ($base == false) {
        return null;
    }

    // Champs complémentaires depuis les tables principales
    $stmt = $pdo->prepare(
        'SELECT s.titre_vo,
                EXTRACT(YEAR FROM s.annee_creation)::int AS annee_creation,
                s.duree_moy_ep,
                s.musique_titre,
                s.musique_groupe,
                g.libelle AS genre,
                p.nom_pays AS pays_origine,
                per.nom AS createur_nom,
                per.prenom AS createur_prenom
         FROM serie s
         JOIN genre g ON s.id_genre = g.id_genre
         JOIN pays p ON s.id_pays = p.id_pays
         JOIN createur c ON s.id_createur = c.id_createur
         JOIN personne per ON c.id_createur = per.id_personne
         WHERE s.id_serie = :id'
    );
    $stmt->execute(['id' => $id]);
    $info = $stmt->fetch(PDO::FETCH_ASSOC);
    if ($info == false) {
        return null;
    }

    // Nombre de saisons
    $stmt = $pdo->prepare('SELECT COUNT(*)::int AS nb_saisons FROM saison WHERE id_serie = :id');
    $stmt->execute(['id' => $id]);
    $nb = $stmt->fetch(PDO::FETCH_ASSOC);

    // Chaînes de diffusion FR et US
    $stmt = $pdo->prepare(
        "SELECT STRING_AGG(ct.nom_chaine, ', ' ORDER BY ct.nom_chaine) AS diffusion_france
         FROM diffuser d
         JOIN chaine_tv ct ON d.id_chaine = ct.id_chaine
         WHERE d.id_serie = :id AND ct.id_pays = 2"
    );
    $stmt->execute(['id' => $id]);
    $fr = $stmt->fetch(PDO::FETCH_ASSOC);

    $stmt = $pdo->prepare(
        "SELECT STRING_AGG(ct.nom_chaine, ', ' ORDER BY ct.nom_chaine) AS diffusion_etats_unis
         FROM diffuser d
         JOIN chaine_tv ct ON d.id_chaine = ct.id_chaine
         WHERE d.id_serie = :id AND ct.id_pays = 1"
    );
    $stmt->execute(['id' => $id]);
    $us = $stmt->fetch(PDO::FETCH_ASSOC);

    // Résumé : premier épisode connu via annexe3Vue
    $stmt = $pdo->prepare(
        'SELECT episode_resume AS resume
         FROM annexe3Vue
         WHERE titre_serie = :titre
         ORDER BY num_saison ASC, num_episode ASC
         LIMIT 1'
    );
    $stmt->execute(['titre' => $base['titre_fr']]);
    $resume = $stmt->fetch(PDO::FETCH_ASSOC);

    return array_merge(
        $base,
        $info,
        ['nb_saisons' => $nb['nb_saisons'] ?? 0],
        $fr ?: [],
        $us ?: [],
        $resume ?: []
    );
}
?>
