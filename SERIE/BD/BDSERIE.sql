CREATE TABLE genre(
   id_genre INT,
   libelle VARCHAR(50),
   PRIMARY KEY(id_genre)
);

CREATE TABLE personne(
   id_personne INT,
   nom VARCHAR(50),
   prenom VARCHAR(50),
   PRIMARY KEY(id_personne)
);

CREATE TABLE personnage(
   id_personnage INT,
   nom_personnage VARCHAR(50),
   description VARCHAR(1000),
   PRIMARY KEY(id_personnage)
);

CREATE TABLE pays(
   id_pays INT,
   nom_pays VARCHAR(100),
   PRIMARY KEY(id_pays)
);

CREATE TABLE chaine_tv(
   id_chaine INT,
   nom_chaine VARCHAR(50),
   id_pays INT NOT NULL,
   PRIMARY KEY(id_chaine),
   FOREIGN KEY(id_pays) REFERENCES pays(id_pays)
);

CREATE TABLE utilisateur(
   id_utilisateur INT,
   email VARCHAR(100) NOT NULL,
   mdp CHAR(64) NOT NULL,
   nom VARCHAR(255) NOT NULL,
   prenom VARCHAR(255) NOT NULL,
   adresse VARCHAR(512) NOT NULL,
   cp VARCHAR(50) NOT NULL,
   ville VARCHAR(255) NOT NULL,
   tel VARCHAR(100) NOT NULL,
   PRIMARY KEY(id_utilisateur),
   UNIQUE(email),
   CHECK (CHAR_LENGTH(mdp) = 64)
);

CREATE TABLE moy_paiement(
   id_utilisateur  INT,
   num_carte VARCHAR(255) NOT NULL,
   date_expiration VARCHAR(50) NOT NULL,
   cvv VARCHAR(50) NOT NULL,
   PRIMARY KEY(id_utilisateur, num_carte),
   FOREIGN KEY(id_utilisateur) REFERENCES utilisateur(id_utilisateur)
);

CREATE TABLE acteur(
   id_acteur INT,
   PRIMARY KEY(id_acteur),
   FOREIGN KEY(id_acteur) REFERENCES personne(id_personne)
);

CREATE TABLE doubleur(
   id_doubleur INT,
   PRIMARY KEY(id_doubleur),
   FOREIGN KEY(id_doubleur) REFERENCES personne(id_personne)
);

CREATE TABLE realisateur(
   id_réalisateur INT,
   PRIMARY KEY(id_réalisateur),
   FOREIGN KEY(id_réalisateur) REFERENCES personne(id_personne)
);

CREATE TABLE scenariste(
   id_scenariste INT,
   PRIMARY KEY(id_scenariste),
   FOREIGN KEY(id_scenariste) REFERENCES personne(id_personne)
);

CREATE TABLE createur(
   id_createur INT,
   PRIMARY KEY(id_createur),
   FOREIGN KEY(id_createur) REFERENCES personne(id_personne)
);

CREATE TABLE producteur(
   id_producteur INT,
   PRIMARY KEY(id_producteur),
   FOREIGN KEY(id_producteur) REFERENCES personne(id_personne)
);

CREATE TABLE position_personnage(
   id_position VARCHAR(50),
   nom_position VARCHAR(100),
   PRIMARY KEY(id_position)
);

CREATE TABLE serie(
   id_serie INT,
   titre_fr VARCHAR(50),
   titre_vo VARCHAR(50),
   annee_creation DATE,
   duree_moy_ep INT,
   musique_titre VARCHAR(50),
   musique_groupe VARCHAR(50),
   id_genre INT NOT NULL,
   id_createur INT NOT NULL,
   id_pays INT NOT NULL,
   PRIMARY KEY(id_serie),
   FOREIGN KEY(id_genre) REFERENCES genre(id_genre),
   FOREIGN KEY(id_createur) REFERENCES createur(id_createur),
   FOREIGN KEY(id_pays) REFERENCES pays(id_pays),
   CHECK (YEAR(annee_creation) > 0 AND YEAR(annee_creation) < YEAR(CURDATE()))
);

CREATE TABLE saison(
   id_serie INT,
   num_saison INT,
   nb_episodes INT,
   date_debut_tournage DATE,
   date_fin_tournage DATE,
   PRIMARY KEY(id_serie, num_saison),
   FOREIGN KEY(id_serie) REFERENCES serie(id_serie),
   CHECK (num_saison > 0),
   CHECK (nb_episodes > 0),
   CHECK (date_debut_tournage < date_fin_tournage)
);

CREATE TABLE episode(
   id_serie INT,
   num_saison INT,
   num_episode INT,
   titre_original VARCHAR(50),
   titre_fr VARCHAR(50),
   date_diff_origine DATE,
   date_diff_fr DATE,
   resume VARCHAR(1000),
   PRIMARY KEY(id_serie, num_saison, num_episode),
   FOREIGN KEY(id_serie, num_saison) REFERENCES saison(id_serie, num_saison),
   CHECK (num_episode > 0)
);

CREATE TABLE interpreter(
   id_personnage INT,
   id_serie INT,
   num_saison INT,
   num_episode INT,
   id_acteur INT,
   id_doubleur INT,
   est_guest_star LOGICAL,
   PRIMARY KEY(id_personnage, id_serie, num_saison, num_episode, id_acteur, id_doubleur),
   FOREIGN KEY(id_personnage) REFERENCES personnage(id_personnage),
   FOREIGN KEY(id_serie, num_saison, num_episode) REFERENCES episode(id_serie, num_saison, num_episode),
   FOREIGN KEY(id_acteur) REFERENCES acteur(id_acteur),
   FOREIGN KEY(id_doubleur) REFERENCES doubleur(id_doubleur)
);

CREATE TABLE ecrire(
   id_serie INT,
   num_saison INT,
   num_episode INT,
   id_scenariste INT,
   PRIMARY KEY(id_serie, num_saison, num_episode, id_scenariste),
   FOREIGN KEY(id_serie, num_saison, num_episode) REFERENCES episode(id_serie, num_saison, num_episode),
   FOREIGN KEY(id_scenariste) REFERENCES scenariste(id_scenariste)
);

CREATE TABLE produire(
   id_serie INT,
   id_producteur INT,
   PRIMARY KEY(id_serie, id_producteur),
   FOREIGN KEY(id_serie) REFERENCES serie(id_serie),
   FOREIGN KEY(id_producteur) REFERENCES producteur(id_producteur)
);

CREATE TABLE diffuser(
   id_serie INT,
   id_chaine INT,
   PRIMARY KEY(id_serie, id_chaine),
   FOREIGN KEY(id_serie) REFERENCES serie(id_serie),
   FOREIGN KEY(id_chaine) REFERENCES chaine_tv(id_chaine)
);

CREATE TABLE realiser(
   id_serie INT,
   num_saison INT,
   num_episode INT,
   id_réalisateur INT,
   PRIMARY KEY(id_serie, num_saison, num_episode, id_réalisateur),
   FOREIGN KEY(id_serie, num_saison, num_episode) REFERENCES episode(id_serie, num_saison, num_episode),
   FOREIGN KEY(id_réalisateur) REFERENCES réalisateur(id_réalisateur)
);

CREATE TABLE avoir(
   id_personnage INT,
   id_position VARCHAR(50),
   PRIMARY KEY(id_personnage, id_position),
   FOREIGN KEY(id_personnage) REFERENCES personnage(id_personnage),
   FOREIGN KEY(id_position) REFERENCES position_personnage(id_position)
);