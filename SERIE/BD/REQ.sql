INSERT INTO pays(id_pays, nom_pays)
VALUES
    (1, 'Etats-Unis'),
    (2, 'France');

INSERT INTO genre(id_genre, libelle)
VALUES (1, 'Drame');

INSERT INTO personne(id_personne, nom, prenom)
VALUES
    (1,  'Shore',      'David'),
    (2,  'Attanasio',  'Paul'),
    (3,  'Jacobs',     'Katie'),
    (4,  'Singer',     'Bryan'),
    (5,  'Laurie',     'Hugh'),
    (6,  'Edelstein',  'Lisa'),
    (7,  'Atkine',     'Féodor'),
    (8,  'Richard',    'Pierre'),
    (9,  'Tirmont',    'Frédérique'),
    (10, 'Cotillard',  'Marion'),
    (11, 'Tunney',     'Robin'),
    (12, 'Sharma',     'Rekha'),
    (13, 'Hughes',     'Ava Rebecca');

INSERT INTO createur(id_createur) 
VALUES (1);

INSERT INTO producteur(id_producteur) 
VALUES (1), 
        (2), 
        (3), 
        (4);

INSERT INTO acteur(id_acteur) 
VALUES (5), 
       (6), 
       (11), 
       (12), 
       (13);

INSERT INTO doubleur(id_doubleur) 
VALUES (7), 
       (8), 
       (9), 
       (10);

INSERT INTO réalisateur(id_réalisateur) 
VALUES (4);

INSERT INTO scenariste(id_scenariste) 
VALUES (1);

INSERT INTO chaine_tv(id_chaine, nom_chaine, id_pays)
VALUES
    (1, 'TF1', 2),
    (2, 'France 2', 2),
    (3, 'Fox', 1);

INSERT INTO serie(id_serie, titre_fr, titre_vo, annee_creation, duree_moy_ep, musique_titre, musique_groupe, id_genre, id_createur, id_pays)
VALUES (1, 'Dr House', 'Dr House Medical Division', STR_TO_DATE('01/01/2004','%d/%m/%Y'), 43, 'Teardrop', 'Massive Attack', 1, 1, 1);

INSERT INTO diffuser(id_serie, id_chaine)
VALUES (1, 1), 
       (1, 2), 
       (1, 3);

INSERT INTO produire(id_serie, id_producteur)
VALUES (1, 1), 
       (1, 2), 
       (1, 3), 
       (1, 4);

INSERT INTO saison(id_serie, num_saison, nb_episodes, date_debut_tournage, date_fin_tournage)
VALUES (1, 1, 22, NULL, NULL);

INSERT INTO episode(id_serie, num_saison, num_episode, titre_original, titre_fr, date_diff_origine, date_diff_fr, resume)
VALUES
    (1, 1, 1, 'Pilot', 'Les Symptômes de Rebecca Adler', STR_TO_DATE('16/11/2004','%d/%m/%Y'), STR_TO_DATE('12/03/2008','%d/%m/%Y'), 'Rebecca, une jeune institutrice d''école maternelle, est emmenée au CHU de Princeton après s''être évanoui pendant la classe. Le docteur House et son équipe pensent à une tumeur au cerveau...'),
    (1, 1, 2, 'Paternity', 'Test de paternité', STR_TO_DATE('23/11/2004','%d/%m/%Y'), STR_TO_DATE('19/03/2008','%d/%m/%Y'), 'Dans cet épisode, un adolescent de seize ans, Dan, est sujet à des cauchemars et des hallucinations. Il se rend à la consultation après avoir été frappé...'),
    (1, 1, 3, 'Occam''s Razor','Chercher l''erreur', STR_TO_DATE('30/11/2004','%d/%m/%Y'), STR_TO_DATE('26/03/2008','%d/%m/%Y'), 'Rebecca, une jeune institutrice d''école maternelle, est emmenée au CHU de Princeton après s''être évanoui pendant la classe. Le docteur House et son...');

INSERT INTO ecrire(id_serie, num_saison, num_episode, id_scenariste)
VALUES (1, 1, 1, 1), 
       (1, 1, 2, 1), 
       (1, 1, 3, 1);

INSERT INTO realiser(id_serie, num_saison, num_episode, id_réalisateur)
VALUES (1, 1, 1, 4);

INSERT INTO position_personnage(id_position, nom_position)
VALUES
    ('chef_diag', 'Chef du service des diagnostics'),
    ('dir_admin', 'Directrice administrative de l''hôpital Princeton-Plainsboro'),
    ('doyen', 'Doyenne de la faculté'),
    ('conseil', 'Membre du conseil de l''hôpital Princeton-Plainsboro'),
    ('comite_greffe', 'Membre du comité de greffe d''organe');

INSERT INTO personnage(id_personnage, nom_personnage, description)
VALUES
    (1, 'Dr Gregory House', 'Dr Gregory House est un médecin pas comme les autres. Il est brillant, mais il n''aime pas être en contact avec ses patients. Son seul ami est Dr Wilson. Il arrive à résoudre les cas médicaux les plus difficiles. Du fait d''un infarctus dans la cuisse droite (5 ans auparavant), il marche avec une canne et prend régulièrement des pilules contre la douleur (Vicodin), cela n''arrange pas son caractère et sa mauvaise humeur.'),
    (2, 'Dr Lisa Cuddy',    'Dr Lisa Cuddy est la chef du Dr House. Elle est la directrice de l''hôpital Princeton. Elle est une alliée de House et le soutient régulièrement dans ses décisions malgré leur relation un peu ambiguë.');

INSERT INTO avoir(id_personnage, id_position)
VALUES
    (1, 'chef_diag'),
    (2, 'dir_admin'),
    (2, 'doyen'),
    (2, 'conseil'),
    (2, 'comite_greffe');

INSERT INTO interpreter(id_personnage, id_serie, num_saison, num_episode, id_acteur, id_doubleur, est_guest_star)
VALUES
    (1, 1, 1, 1, 5,  7,  FALSE),
    (1, 1, 1, 2, 5,  8,  FALSE),
    (2, 1, 1, 1, 6,  9,  FALSE),
    (2, 1, 1, 2, 6,  10, FALSE),
    (1, 1, 1, 1, 11, 7,  TRUE),
    (2, 1, 1, 1, 12, 9,  TRUE),
    (2, 1, 1, 1, 13, 9,  TRUE);

