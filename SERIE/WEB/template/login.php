<?php
// Initialise les variables d'erreur et de succès pour éviter les notices
$erreur = isset($erreur) ? $erreur : '';
$success = isset($success) ? $success : '';
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Connexion — SERIE</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="container">
    <h1>S'identifier</h1>

    <?php if ($erreur)  echo '<p class="erreur">'  . $erreur  . '</p>'; ?>
    <?php if ($success) echo '<p class="success">' . $success . '</p>'; ?>

    <form method="POST" action="index.php">
        <input type="hidden" name="action" value="login">

        <label for="email">Adresse e-mail</label>
        <input type="email" id="email" name="email" placeholder="exemple@mail.com" required>

        <label for="mdp">Mot de passe</label>
        <input type="password" id="mdp" name="mdp" placeholder="Mot de passe" required>

        <button type="submit">S'identifier</button>
    </form>

    <div class="lien">
        <p>Première visite ? <a href="index.php?action=register">Inscrivez-vous</a></p>
    </div>
</div>
</body>
</html>
