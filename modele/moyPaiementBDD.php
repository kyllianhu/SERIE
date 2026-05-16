<?php
require_once "myParam.inc.php";
require_once "moyPaiement.php";

// Insère un moyen de paiement chiffré pour l'utilisateur donné
function insererMoyPaiement(int $id_utilisateur, MoyPaiement $paiement) {
    $pdo = getConnexion();
    $sql = "INSERT INTO moy_paiement (id_utilisateur, num_carte, date_expiration, cvv)
            VALUES (:id_utilisateur, :num_carte, :date_expiration, :cvv)";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([
        ':id_utilisateur' => $id_utilisateur,
        ':num_carte' => $paiement->getNumCarte(),
        ':date_expiration' => $paiement->getDateExpiration(),
        ':cvv' => $paiement->getCvv(),
    ]);
}
?>
