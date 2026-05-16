<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>S<?= $saison ?>E<?= $episode ?> - <?= htmlentities($serie['titre_fr']) ?></title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<header class="topbar">
    <a href="index.php?action=series" class="topbar-title">SERIE</a>
    <a href="index.php" class="topbar-logout">Se déconnecter</a>
</header>

<div class="page-wrapper">
    <div class="nf-hero" style="min-height: 60vh;">
        <div class="nf-hero-bg">
            <img src="<?= htmlentities($episodeIllustration) ?>" alt="">
            <div class="nf-hero-vignette"></div>
        </div>
        <div class="nf-hero-content" style="padding-top: 60px; position: relative; z-index: 10;">
            <div style="margin-bottom: 20px;">
                <a href="index.php?action=saisons&id=<?= $id ?>&saison=<?= $saison ?>" class="back-link" style="position: relative; z-index: 200;">Retour à la saison <?= $saison ?></a>
            </div>
            <h1 class="nf-hero-title">S<?= $saison ?> : E<?= $episode ?> - <?= htmlentities($ep['titre_fr_episode'] ?: $ep['titre_original']) ?></h1>
            <div class="nf-meta-row">
                <span class="nf-badge">Épisode</span>
                <?php if($ep['titre_original']): ?><span>VO: <?= htmlentities($ep['titre_original']) ?></span><?php endif; ?>
            </div>
            <p class="nf-synopsis"><?= htmlentities($ep['resume']) ?></p>

            <div class="nf-hero-details">
                <?php if($scenaristes): ?>
                <div class="nf-details-item"><span class="nf-details-label">Scénario : </span><span class="nf-details-value"><?= htmlentities(implode(', ', $scenaristes)) ?></span></div>
                <?php endif; ?>
                <?php if($realisateurs): ?>
                <div class="nf-details-item"><span class="nf-details-label">Réalisation : </span><span class="nf-details-value"><?= htmlentities(implode(', ', $realisateurs)) ?></span></div>
                <?php endif; ?>
                <?php if($ep['date_diff_origine'] || $ep['date_diff_fr']): ?>
                <div class="nf-details-item"><span class="nf-details-label">Diffusion : </span><span class="nf-details-value"><?= htmlentities($ep['date_diff_origine'] ?? '-') ?> (US) / <?= htmlentities($ep['date_diff_fr'] ?? '-') ?> (FR)</span></div>
                <?php endif; ?>
                <?php if($guestStars): ?>
                <div class="nf-details-item" style="grid-column: 1 / -1;"><span class="nf-details-label">Guest Stars : </span><span class="nf-details-value"><?= htmlentities(implode(', ', $guestStars)) ?></span></div>
                <?php endif; ?>
            </div>

            <div class="nf-actions" style="margin-top: 30px;">
                <a href="#" onclick="openVideo(); return false;" class="nf-btn nf-btn-play">
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="currentColor"><path d="M6 4l15 8-15 8z"/></svg>
                    Lecture
                </a>
                <a href="index.php?action=personnages&id=<?= $id ?>&saison=<?= $saison ?>&episode=<?= $episode ?>" class="nf-btn nf-btn-secondary">Voir les personnages</a>
            </div>
        </div>
    </div>
</div>

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
