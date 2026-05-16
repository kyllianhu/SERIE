<?php
// Initialise la variable d'erreur pour éviter les notices
$erreur = isset($erreur) ? $erreur : '';
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Informations — SERIE</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="container large">

    <?php if ($erreur) echo '<p class="erreur">' . $erreur . '</p>'; ?>

    <form method="POST" action="index.php">
        <input type="hidden" name="action" value="paiement">

        <h2>Personal Details</h2>

        <div class="row">
            <div class="field">
                <label for="prenom">First Name</label>
                <input type="text" id="prenom" name="prenom" placeholder="John" required>
            </div>
            <div class="field">
                <label for="nom">Last Name</label>
                <input type="text" id="nom" name="nom" placeholder="Smith" required>
            </div>
        </div>

        <label for="adresse">Street Address</label>
        <input type="text" id="adresse" name="adresse" placeholder="312 Newfound Drive" required>

        <div class="row">
            <div class="field">
                <label for="cp">ZIP Code</label>
                <input type="text" id="cp" name="cp" placeholder="70001" required>
            </div>
            <div class="field">
                <label for="ville">City</label>
                <input type="text" id="ville" name="ville" placeholder="Paris" required>
            </div>
        </div>

        <label for="tel">Phone Number</label>
        <input type="tel" id="tel" name="tel" placeholder="0123456789" required>

        <h2>Payment Details</h2>

        <label for="num_carte">Credit Card Number</label>
        <input type="text" id="num_carte" name="num_carte" placeholder="4001 2000 3000 4000" required maxlength="19">

        <div class="row">
            <div class="field">
                <label for="mois">Month</label>
                <select id="mois" name="mois" required>
                    <?php
                    // Construit la liste des mois 01-12
                    $mois = ['01','02','03','04','05','06','07','08','09','10','11','12'];
                    foreach ($mois as $m): ?>
                        <option value="<?= $m ?>"><?= $m ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div class="field">
                <label for="annee">Year</label>
                <select id="annee" name="annee" required>
                    <?php
                    // Génère les années de l'année courante + 10
                    for ($y = date('Y'); $y <= date('Y') + 10; $y++): ?>
                        <option value="<?= $y ?>"><?= $y ?></option>
                    <?php endfor; ?>
                </select>
            </div>
            <div class="field">
                <label for="cvv">CVV</label>
                <input type="text" id="cvv" name="cvv" placeholder="•••" maxlength="4" required>
            </div>
        </div>

        <button type="submit" class="btn-right">Continue</button>
    </form>
</div>
</body>
</html>
