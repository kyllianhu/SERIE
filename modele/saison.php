<?php
// Classe représentant une saison d'une série télévisée
class Saison {
    private int $num_saison;
    private int $nb_episodes;
    private string $date_debut_tournage;
    private string $date_fin_tournage;

    // Valide et affecte les données de la saison à la construction
    public function __construct(int $num_saison, int $nb_episodes, string $date_debut_tournage, string $date_fin_tournage) {
        $this->setNumSaison($num_saison);
        $this->setNbEpisodes($nb_episodes);
        $this->setDateDebutTournage($date_debut_tournage);
        $this->setDateFinTournage($date_fin_tournage);
    }

    public function __destruct() {
        echo "Destruction de l'objet Saison : " . $this->num_saison . "<br>";
    }

    // Valide que le numéro de saison est strictement positif
    public function setNumSaison(int $num_saison): void {
        if ($num_saison <= 0) die("Erreur : le numéro de saison doit être supérieur à 0.");
        $this->num_saison = $num_saison;
    }

    public function getNumSaison(): int { return $this->num_saison; }

    // Valide que le nombre d'épisodes est strictement positif
    public function setNbEpisodes(int $nb_episodes): void {
        if ($nb_episodes <= 0) die("Erreur : le nombre d'épisodes doit être supérieur à 0.");
        $this->nb_episodes = $nb_episodes;
    }

    public function getNbEpisodes(): int { return $this->nb_episodes; }

    // Valide que la date de début de tournage est renseignée
    public function setDateDebutTournage(string $date_debut_tournage): void {
        if (empty($date_debut_tournage)) die("Erreur : la date de début de tournage est obligatoire.");
        $this->date_debut_tournage = $date_debut_tournage;
    }

    public function getDateDebutTournage(): string { return $this->date_debut_tournage; }

    // Valide que la date de fin de tournage est renseignée
    public function setDateFinTournage(string $date_fin_tournage): void {
        if (empty($date_fin_tournage)) die("Erreur : la date de fin de tournage est obligatoire.");
        $this->date_fin_tournage = $date_fin_tournage;
    }

    public function getDateFinTournage(): string { return $this->date_fin_tournage; }
}
?>
