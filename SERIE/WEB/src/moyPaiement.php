<?php
// Classe représentant un moyen de paiement avec chiffrement AES-256 des données sensibles
class MoyPaiement {
    private string $num_carte;
    private string $date_expiration;
    private string $cvv;

    // Chiffre et stocke les données de carte à la construction
    public function __construct(string $num_carte, string $date_expiration, string $cvv) {
        $this->setNumCarte($num_carte);
        $this->setDateExpiration($date_expiration);
        $this->setCvv($cvv);
    }

    public function __destruct() {}

    // Valide et chiffre le numéro de carte
    public function setNumCarte(string $num_carte): void {
        if (empty($num_carte)) die("Erreur : le numéro de carte est obligatoire.");
        $this->num_carte = $this->chiffrerDonnees($num_carte);
    }

    public function getNumCarte(): string { return $this->num_carte; }

    // Valide et chiffre la date d'expiration
    public function setDateExpiration(string $date_expiration): void {
        if (empty($date_expiration)) die("Erreur : la date d'expiration est obligatoire.");
        $this->date_expiration = $this->chiffrerDonnees($date_expiration);
    }

    public function getDateExpiration(): string { return $this->date_expiration; }

    // Valide et chiffre le CVV
    public function setCvv(string $cvv): void {
        if (empty($cvv)) die("Erreur : le CVV est obligatoire.");
        $this->cvv = $this->chiffrerDonnees($cvv);
    }

    public function getCvv(): string { return $this->cvv; }

    // Chiffre une donnée avec AES-256-CBC, retourne base64(IV . chiffré)
    private function chiffrerDonnees(string $donnee): string {
        $cle = hash('sha256', PASS, true);
        $iv = random_bytes(16);
        $chiffre = openssl_encrypt($donnee, 'aes-256-cbc', $cle, 0, $iv);
        return base64_encode($iv . $chiffre);
    }
}
?>
