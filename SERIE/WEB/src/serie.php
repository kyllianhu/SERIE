<?php
// Classe DTO portant les données de base d'une série
class Serie {
    public string $titre_fr = '';
    public string $titre_vo = '';
    public ?string $image = null;
    public string $annee_creation = '';
    public int $duree_moy_ep = 0;
    public string $musique_titre = '';
    public string $musique_groupe = '';
}
?>