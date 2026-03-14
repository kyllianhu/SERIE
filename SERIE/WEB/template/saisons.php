<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= htmlentities($serie['titre_fr']) ?> — Saisons</title>
    <link rel="stylesheet" href="style.css">
</head>
<body class="page-saisons">
<header class="topbar">
    <a href="index.php?action=series" class="topbar-title">SERIE</a>
    <a href="index.php" class="topbar-logout">Se déconnecter</a>
</header>

<div class="page-wrapper">
    <div class="content-padding">
        <a href="index.php?action=serie&id=<?= $id ?>" class="back-link">Retour à la fiche série</a>
    </div>

    <div class="subpage-header">
        <div>
            <h1 class="subpage-title"><?= htmlentities($serie['titre_fr']) ?></h1>
            <div class="subpage-subtitle">
                <?php if(!empty($prods)): ?>Producteurs : <?= htmlentities(implode(', ', $prods)) ?> | <?php endif; ?>
                Épisodes : <?= $header['nb_episodes'] ?? '?' ?> |
                Tournage : <?= $header['date_debut_tournage'] ?? '-' ?> à <?= $header['date_fin_tournage'] ?? '-' ?>
            </div>
        </div>
        <!-- Sélecteur de saison : soumet vers index.php?action=saisons -->
        <form method="get" action="index.php" class="season-selector">
            <input type="hidden" name="action" value="saisons">
            <input type="hidden" name="id" value="<?= $id ?>">
            <select name="saison" onchange="this.form.submit()">
                <?php foreach ($saisons as $sa): $ns = (int)$sa['num_saison']; ?>
                    <option value="<?= $ns ?>" <?= $ns == $saison ? 'selected' : '' ?>>Saison <?= $ns ?></option>
                <?php endforeach; ?>
            </select>
        </form>
    </div>

    <div class="nf-episode-list">
        <?php foreach ($rows as $r): ?>
            <div class="nf-episode-row">
                <div class="nf-ep-number"><?= (int)$r['num_episode'] ?></div>
                <div class="nf-ep-thumb">
                    <img src="<?= htmlentities($episodeIllustration) ?>" alt="Illustration épisode">
                </div>
                <div class="nf-ep-info">
                    <div class="nf-ep-header">
                        <div class="nf-ep-title"><?= htmlentities($r['episode_titre_fr'] ?: $r['episode_titre_original'] ?: 'Épisode ' . (int)$r['num_episode']) ?></div>
                    </div>
                    <?php if (!empty($r['episode_resume'])): ?>
                        <p class="nf-ep-desc"><?= htmlentities($r['episode_resume']) ?></p>
                    <?php endif; ?>
                    <div class="nf-action-buttons">
                        <a href="index.php?action=episode&id=<?= $id ?>&saison=<?= $saison ?>&episode=<?= (int)$r['num_episode'] ?>" class="nf-btn-sm">Détails épisode</a>
                        <a href="index.php?action=personnages&id=<?= $id ?>&saison=<?= $saison ?>&episode=<?= (int)$r['num_episode'] ?>" class="nf-btn-sm">Personnages</a>
                    </div>
                </div>
            </div>
        <?php endforeach; ?>
    </div>
</div>
</body>
</html>
