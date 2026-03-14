<?php
// Initialise la variable d'erreur pour éviter les notices
$erreur = isset($erreur) ? $erreur : '';
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Créer un compte — SERIE</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="container">
    <h1>Créez votre compte</h1>

    <?php if ($erreur) echo '<p class="erreur">' . $erreur . '</p>'; ?>

    <form method="POST" action="index.php">
        <input type="hidden" name="action" value="register">

        <label for="email">Adresse e-mail</label>
        <input type="email" id="email" name="email" placeholder="exemple@mail.com" required>

        <label for="mdp">Mot de passe</label>
        <input type="password" id="mdp" name="mdp" placeholder="Entre 4 et 60 caractères" required minlength="4" maxlength="60">
        <p class="hint">Entre 4 et 60 caractères</p>

        <label for="mdp_confirm">Confirmer le mot de passe</label>
        <input type="password" id="mdp_confirm" name="mdp_confirm" placeholder="Confirmez votre mot de passe" required>

        <button type="submit">Créer un compte</button>
    </form>

    <div class="lien">
        <p>Déjà un compte ? <a href="index.php">S'identifier</a></p>
    </div>
</div>
</body>
</html>
