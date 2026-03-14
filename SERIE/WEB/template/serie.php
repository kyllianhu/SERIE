<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= htmlentities($serie['titre_fr']) ?> — SERIE</title>
    <link rel="stylesheet" href="style.css">
</head>
<body class="page-serie">

<header class="topbar">
    <a href="index.php?action=series" class="topbar-title">SERIE</a>
    <a href="index.php" class="topbar-logout">Se déconnecter</a>
</header>

<main class="page-wrapper" style="min-height: auto; padding-bottom:0;">
    <div class="nf-hero">
        <div class="nf-hero-bg">
            <img src="<?= htmlentities($heroImage) ?>" alt="">
            <div class="nf-hero-vignette"></div>
        </div>

        <div class="nf-hero-content">
            <h1 class="nf-hero-title"><?= htmlentities($serie['titre_fr']) ?></h1>

            <div class="nf-meta-row">
                <span class="nf-badge-accent">Recommandé à 98%</span>
                <?php if(!empty($serie['annee_creation'])): ?><span><?= (int)$serie['annee_creation'] ?></span><?php endif; ?>
                <?php if(isset($serie['nb_saisons'])): ?><span class="nf-badge"><?= (int)$serie['nb_saisons'] ?> Saison(s)</span><?php endif; ?>
                <span class="nf-badge">HD</span>
            </div>

            <p class="nf-synopsis"><?= htmlentities($serie['resume'] ?? 'Aucun résumé disponible pour cette série.') ?></p>

            <div class="nf-actions">
                <a href="#" onclick="openVideo(); return false;" class="nf-btn nf-btn-play">
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="currentColor"><path d="M6 4l15 8-15 8z"/></svg>
                    Lecture
                </a>
                <a href="index.php?action=saisons&id=<?= $id ?>" class="nf-btn nf-btn-secondary">
                    Épisodes et Infos
                </a>
            </div>

            <div class="nf-hero-details">
                <?php if($createur): ?>
                <div class="nf-details-item">
                    <span class="nf-details-label">Créateur :</span>
                    <span class="nf-details-value"><?= htmlentities($createur) ?></span>
                </div>
                <?php endif; ?>

                <?php if(!empty($serie['genre'])): ?>
                <div class="nf-details-item">
                    <span class="nf-details-label">Genre :</span>
                    <span class="nf-details-value"><?= htmlentities($serie['genre']) ?></span>
                </div>
                <?php endif; ?>

                <?php if(!empty($serie['titre_vo'])): ?>
                <div class="nf-details-item">
                    <span class="nf-details-label">Titre VO :</span>
                    <span class="nf-details-value"><?= htmlentities($serie['titre_vo']) ?></span>
                </div>
                <?php endif; ?>

                <div class="nf-details-item">
                    <span class="nf-details-label">Origine :</span>
                    <span class="nf-details-value"><?= htmlentities($serie['pays_origine'] ?? '-') ?></span>
                </div>

                <div class="nf-details-item">
                    <span class="nf-details-label">Durée moy. :</span>
                    <span class="nf-details-value"><?= !empty($serie['duree_moy_ep']) ? ((int)$serie['duree_moy_ep'] . ' min') : '-' ?></span>
                </div>

                <?php if($musique): ?>
                <div class="nf-details-item">
                    <span class="nf-details-label">Musique :</span>
                    <span class="nf-details-value"><?= htmlentities($musique) ?></span>
                </div>
                <?php endif; ?>

                <?php if(!empty($serie['diffusion_france']) || !empty($serie['diffusion_etats_unis'])): ?>
                <div class="nf-details-item">
                    <span class="nf-details-label">Diffusion :</span>
                    <span class="nf-details-value">
                        <?= htmlentities($serie['diffusion_etats_unis'] ?? '') ?> (US)
                        / <?= htmlentities($serie['diffusion_france'] ?? '') ?> (FR)
                    </span>
                </div>
                <?php endif; ?>
            </div>
        </div>
    </div>
</main>

<div id="videoModal" class="video-modal">
    <div class="video-modal-content">
        <button class="video-modal-close" onclick="closeVideo()">&times;</button>
        <iframe id="videoFrame" allowfullscreen allow="autoplay; encrypted-media"></iframe>
    </div>
</div>

<script>
function openVideo() {
    document.getElementById('videoModal').classList.add('active');
    document.getElementById('videoFrame').src = "https://www.youtube.com/embed/snYJX1ara_g?autoplay=1";
}
function closeVideo() {
    document.getElementById('videoModal').classList.remove('active');
    document.getElementById('videoFrame').src = "";
}
// Fermer la vidéo si on clique sur le fond noir à l'extérieur
document.getElementById('videoModal').addEventListener('click', function(e) {
    if (e.target == this) closeVideo();
});
</script>

</body>
</html>
