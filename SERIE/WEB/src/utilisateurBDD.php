<?php
require_once "myParam.inc.php";
require_once "utilisateur.php";

// Insère un nouvel utilisateur en base et retourne son identifiant généré
function insererUtilisateur(string $email, string $mdpHash, string $nom, string $prenom, string $adresse, string $cp, string $ville, string $tel): int {
    $pdo  = getConnexion();
    $sql  = "INSERT INTO utilisateur (email, mdp, nom, prenom, adresse, cp, ville, tel)
             VALUES (:email, :mdp, :nom, :prenom, :adresse, :cp, :ville, :tel) RETURNING id_utilisateur";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([
        ':email'   => $email,
        ':mdp'     => $mdpHash,
        ':nom'     => $nom,
        ':prenom'  => $prenom,
        ':adresse' => $adresse,
        ':cp'      => $cp,
        ':ville'   => $ville,
        ':tel'     => $tel,
    ]);
    return (int) $stmt->fetchColumn(0);
}

// Vérifie les identifiants (accepte le mot de passe en clair ou hashé SHA-256)
function verifierConnexion($email, $mdp) {
    $pdo  = getConnexion();
    $hash = hash('sha256', $mdp);
    $sql  = "SELECT id_utilisateur FROM utilisateur WHERE email = :email AND (mdp = :mdp_plain OR mdp = :mdp_hash)";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([':email' => $email, ':mdp_plain' => $mdp, ':mdp_hash' => $hash]);
    return $stmt->fetch(PDO::FETCH_ASSOC);
}
?>
