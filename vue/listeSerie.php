<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Séries — SERIE</title>
    <link rel="stylesheet" href="style.css">
</head>
<body class="page-series">
<div class="page-wrapper">

    <header class="topbar">
        <span class="topbar-title">SERIE</span>
        <a href="index.php" class="topbar-logout">Se déconnecter</a>
    </header>

    <main>
        <h1>Galerie des séries</h1>

        <?php if (empty($series)): ?>
            <p class="erreur">Aucune série disponible pour le moment.</p>
        <?php else: ?>
            <div class="grid-series">
                <?php foreach ($series as $serie): ?>
                    <div class="card-series">
                        <?php
                            $img = $serie['image'] ?? null;
                            $id = (int)($serie['id_serie'] ?? 0);
                            // Image spécifique pour Dr House (id_serie = 1)
                            if ($id == 1) {
                                $img = 'https://photos.tf1.fr/700/933/dr-house-vignette_portrait-90bb84-0@1x.jpg';
                            }
                        ?>
                        <?php if ($img): ?>
                            <a href="index.php?action=serie&id=<?= urlencode((string)$id) ?>">
                                <img src="<?= $img ?>" alt="<?= htmlentities($serie['titre_fr']) ?>" class="poster">
                            </a>
                        <?php else: ?>
                            <a href="index.php?action=serie&id=<?= urlencode((string)$id) ?>" class="poster poster-empty-link">
                                <div class="poster poster-empty"><?= htmlentities($serie['titre_fr']) ?></div>
                            </a>
                        <?php endif; ?>
                        <div class="card-meta">
                            <div class="card-title"><?= htmlentities($serie['titre_fr']) ?></div>
                        </div>
                    </div>
                <?php endforeach; ?>
            </div>
        <?php endif; ?>
    </main>

</div>
</body>
</html>
