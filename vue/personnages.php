<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Personnages - S<?= $saison ?>E<?= $episode ?> - <?= htmlentities($serie['titre_fr']) ?></title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<header class="topbar">
    <a href="index.php?action=series" class="topbar-title">SERIE</a>
    <a href="index.php" class="topbar-logout">Se déconnecter</a>
</header>

<div class="page-wrapper">
    <div class="content-padding">
        <a href="index.php?action=saisons&id=<?= $id ?>&saison=<?= $saison ?>" class="back-link">Retour à la saison <?= $saison ?></a>
        <div class="subpage-header" style="margin-top: 20px;">
            <div>
                <h1 class="subpage-title">Personnages de l'épisode</h1>
                <div class="subpage-subtitle"><?= htmlentities($serie['titre_fr']) ?> - Saison <?= $saison ?> Épisode <?= $episode ?></div>
            </div>
            <div>
                <a href="index.php?action=episode&id=<?= $id ?>&saison=<?= $saison ?>&episode=<?= $episode ?>" class="nf-btn-sm" style="font-size: 1rem; padding: 10px 20px;">Détails de l'épisode</a>
            </div>
        </div>
    </div>

    <div class="nf-cast-grid">
        <?php if(empty($persos)): ?>
            <p style="color:#b3b3b3;">Aucun personnage référencé pour cet épisode.</p>
        <?php endif; ?>
        <?php foreach ($persos as $p): ?>
            <div class="nf-cast-card">
                <div class="nf-cast-name"><?= htmlentities($p['nom']) ?></div>
                <div class="nf-cast-role"><?= htmlentities(implode(', ', $p['positions'])) ?></div>
                <div class="nf-cast-meta">
                    <?php if($p['acteur']): ?>Joué par : <strong><?= htmlentities($p['acteur']) ?></strong><br><?php endif; ?>
                    <?php if($p['doubleur']): ?>Doublé par : <strong><?= htmlentities($p['doubleur']) ?></strong><?php endif; ?>
                </div>
                <?php if($p['desc']): ?>
                    <div class="nf-cast-desc"><?= htmlentities($p['desc']) ?></div>
                <?php endif; ?>
            </div>
        <?php endforeach; ?>
    </div>
</div>
</body>
</html>
