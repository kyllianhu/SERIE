INSERT INTO genre (id_genre, libelle) VALUES (1, 'Medical Drama');
INSERT INTO pays (id_pays, nom_pays) VALUES (1, 'USA'), (2, 'France');

INSERT INTO personne (id_personne, nom, prenom) VALUES 
(1, 'Shore', 'David'),
(2, 'Laurie', 'Hugh'),
(3, 'Atkine', 'Féodor'),
(4, 'Richard', 'Pierre'),
(5, 'Singer', 'Bryan'),
(6, 'Attanasio', 'Paul'),
(7, 'Tunney', 'Robin');

INSERT INTO createur (id_createur) VALUES (1);
INSERT INTO acteur (id_acteur) VALUES (2), (7);
INSERT INTO doubleur (id_doubleur) VALUES (3), (4);
INSERT INTO réalisateur (id_réalisateur) VALUES (5);
INSERT INTO producteur (id_producteur) VALUES (5), (6);

INSERT INTO serie (id_serie, titre_fr, titre_vo, annee_creation, duree_moy_ep, musique_titre, musique_groupe, id_genre, id_createur, id_pays) 
VALUES (1, 'Dr House', 'House M.D.', '2004-11-16', 43, 'Teardrop', 'Massive Attack', 1, 1, 1);

INSERT INTO saison (id_serie, num_saison, nb_episodes, date_debut_tournage, date_fin_tournage) 
VALUES (1, 1, 22, NULL, NULL);

INSERT INTO episode (id_serie, num_saison, num_episode, titre_original, titre_fr, date_diff_origine, date_diff_fr, resume) 
VALUES 
(1, 1, 1, 'Pilot', 'Les Symptômes de Rebecca Adler', '2004-11-16', '2007-02-28', 'Une enseignante de maternelle s''effondre en classe...'),
(1, 1, 2, 'Paternity', 'La Vie de l''autre', '2004-11-23', '2007-02-28', 'Un adolescent souffre de terreurs nocturnes...');

INSERT INTO personnage (id_serie, id_personnage, nom_personnage, description) VALUES 
(1, 1, 'Gregory House', NULL),
(1, 2, 'Rebecca Adler', NULL);

INSERT INTO interpreter (id_serie, num_saison, num_episode, id_serie_pers, id_personnage, id_acteur, id_doubleur, est_guest_star) 
VALUES 
(1, 1, 1, 1, 1, 2, 3, FALSE),
(1, 1, 2, 1, 1, 2, 4, FALSE),
(1, 1, 1, 1, 2, 7, 3, TRUE);

INSERT INTO realiser (id_serie, num_saison, num_episode, id_réalisateur) VALUES (1, 1, 1, 5);
INSERT INTO produire (id_serie, id_producteur) VALUES (1, 5), (1, 6);

INSERT INTO utilisateur (id_utilisateur, email, mdp, nom_utilisateur, prenom_utilisateur, adresse, cp, tel) 
VALUES (1, 'jean.dupont@email.com', 'mdpjeandupont', 'Dupont', 'Jean', '12 rue des Fleurs', '75001', '0102030405');

INSERT INTO moy_paiement (id_utilisateur, num_carte, mois_expiration, annee_expiration, cvv) 
VALUES (1, '4001200030004000', 12, 2028, 123);