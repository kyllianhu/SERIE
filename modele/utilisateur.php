<?php
// Classe représentant un utilisateur avec chiffrement AES-256 des données personnelles
class Utilisateur {
    private string $email;
    private string $mdp;
    private string $nom;
    private string $prenom;
    private string $adresse;
    private string $cp;
    private string $ville;
    private string $tel;

    // Valide et affecte tous les champs à la construction
    public function __construct(string $email, string $mdp, string $nom, string $prenom, string $adresse, string $cp, string $ville, string $tel) {
        $this->setEmail($email);
        $this->setMdp($mdp);
        $this->setNom($nom);
        $this->setPrenom($prenom);
        $this->setAdresse($adresse);
        $this->setCp($cp);
        $this->setVille($ville);
        $this->setTel($tel);
    }

    public function __destruct() {}

    // Valide et stocke l'email
    public function setEmail(string $email): void {
        if (empty($email)) die("Erreur : l'email est obligatoire.");
        $this->email = $email;
    }

    public function getEmail(): string { return $this->email; }

    // Hache le mot de passe en SHA-256 avant stockage
    public function setMdp(string $mdp): void {
        if (empty($mdp)) die("Erreur : le mot de passe est obligatoire.");
        $this->mdp = $this->hacherMotDePasse($mdp);
    }

    public function getMdp(): string { return $this->mdp; }

    // Chiffre et stocke le nom
    public function setNom(string $nom): void {
        if (empty($nom)) die("Erreur : le nom est obligatoire.");
        $this->nom = $this->chiffrerDonnees($nom);
    }

    public function getNom(): string { return $this->nom; }

    // Chiffre et stocke le prénom
    public function setPrenom(string $prenom): void {
        if (empty($prenom)) die("Erreur : le prénom est obligatoire.");
        $this->prenom = $this->chiffrerDonnees($prenom);
    }

    public function getPrenom(): string { return $this->prenom; }

    // Chiffre et stocke l'adresse
    public function setAdresse(string $adresse): void {
        if (empty($adresse)) die("Erreur : l'adresse est obligatoire.");
        $this->adresse = $this->chiffrerDonnees($adresse);
    }

    public function getAdresse(): string { return $this->adresse; }

    // Chiffre et stocke le code postal
    public function setCp(string $cp): void {
        if (empty($cp)) die("Erreur : le code postal est obligatoire.");
        $this->cp = $this->chiffrerDonnees($cp);
    }

    public function getCp(): string { return $this->cp; }

    // Chiffre et stocke la ville
    public function setVille(string $ville): void {
        if (empty($ville)) die("Erreur : la ville est obligatoire.");
        $this->ville = $this->chiffrerDonnees($ville);
    }

    public function getVille(): string { return $this->ville; }

    // Chiffre et stocke le téléphone
    public function setTel(string $tel): void {
        if (empty($tel)) die("Erreur : le téléphone est obligatoire.");
        $this->tel = $this->chiffrerDonnees($tel);
    }

    public function getTel(): string { return $this->tel; }

    // Hache le mot de passe avec SHA-256
    private function hacherMotDePasse(string $mdp): string {
        return hash('sha256', $mdp);
    }

    // Chiffre une donnée avec AES-256-CBC, retourne base64(IV . chiffré)
    private function chiffrerDonnees(string $donnee): string {
        $cle = hash('sha256', PASS, true);
        $iv = random_bytes(16);
        $chiffre = openssl_encrypt($donnee, 'aes-256-cbc', $cle, 0, $iv);
        return base64_encode($iv . $chiffre);
    }
}
?>
