INSERT INTO pays(id_pays, nom_pays) VALUES (1, 'Etats-Unis'), (2, 'France');
INSERT INTO genre(id_genre, libelle) VALUES (1, 'Drame Médical'), (2, 'Science-Fiction');
INSERT INTO personne(id_personne, nom, prenom) VALUES
(1, 'Shore', 'David'),
(2, 'Laurie', 'Hugh'),
(3, 'Edelstein', 'Lisa'),
(4, 'Wilson', 'Robert'),
(5, 'Tunney', 'Robin'),
(6, 'Hammond', 'ActorExample'),
(7, 'Singer', 'Bryan'),
(8, 'Massive Attack', ''),
(9, 'Rekha', 'Sharma'),
(10, 'Hughes', 'Rebecca'),
(11, 'Epps', 'Omar'),
(12, 'Spencer', 'Jesse'),
(13, 'Morrison', 'Jennifer'),
(14, 'Leonard', 'Robert Sean'),
(15, 'Jacobson', 'Olivia Wilde'),
(16, 'Penn', 'Kal'),
(17, 'Tamblyn', 'Amber'),
(18, 'Yeo', 'Charlyne Yi'),
(19, 'Annable', 'Odette'),
(20, 'Wilde', 'Peter');
INSERT INTO createur(id_createur) VALUES (1);
INSERT INTO acteur(id_acteur) VALUES (2), (3), (5), (6), (9), (10), (11), (12), (13), (14), (15), (16), (17), (18), (19), (20);
INSERT INTO realisateur(id_realisateur) VALUES (7);
INSERT INTO producteur(id_producteur) VALUES (4), (5);
INSERT INTO doubleur(id_doubleur) VALUES (2);
INSERT INTO scenariste(id_scenariste) VALUES (1);
INSERT INTO chaine_tv(id_chaine, nom_chaine, id_pays) VALUES
(10, 'Fox', 1),
(1, 'TF1', 1),
(2, 'France 2', 1);
INSERT INTO serie(id_serie, titre_fr, titre_vo, image, annee_creation, duree_moy_ep, musique_titre, musique_groupe, id_genre, id_createur, id_pays) VALUES (1, 'Dr House', 'House M.D.', 'https://image.tmdb.org/t/p/original/mrsBNCw0b7GzM3NqfS5vU8I8N1u.jpg', '2004-11-16', 43, 'Teardrop', 'Massive Attack', 1, 1, 1);
INSERT INTO produire(id_serie, id_producteur) VALUES (1, 5), (1, 4);
INSERT INTO diffuser(id_serie, id_chaine) VALUES (1, 10), (1, 1), (1, 2);
INSERT INTO saison(id_serie, num_saison, nb_episodes, date_debut_tournage, date_fin_tournage) VALUES 
(1, 1, 22, '2004-01-01', '2004-12-31'),
(1, 2, 24, '2005-01-01', '2005-12-31');
INSERT INTO episode(id_serie, num_saison, num_episode, titre_original, titre_fr, date_diff_origine, date_diff_fr, resume, image) VALUES (1, 1, 1, 'Pilot', 'Les Symptômes de Rebecca Adler', '2004-11-16', '2008-03-12', 'Rebecca, une jeune institutrice s''effondre...', NULL);
INSERT INTO ecrire(id_serie, num_saison, num_episode, id_scenariste) VALUES (1, 1, 1, 1);
INSERT INTO realiser(id_serie, num_saison, num_episode, id_realisateur) VALUES (1, 1, 1, 7);
INSERT INTO episode(id_serie, num_saison, num_episode, titre_original, titre_fr, date_diff_origine, date_diff_fr, resume, image) VALUES (1, 1, 2, 'Paternity', 'Test de paternité', '2004-11-16', '2008-03-12', 'Un adolescent de 16 ans a des visions et des crises...', NULL);
INSERT INTO ecrire(id_serie, num_saison, num_episode, id_scenariste) VALUES (1, 1, 2, 1);
INSERT INTO realiser(id_serie, num_saison, num_episode, id_realisateur) VALUES (1, 1, 2, 7);
INSERT INTO episode(id_serie, num_saison, num_episode, titre_original, titre_fr, date_diff_origine, date_diff_fr, resume, image) VALUES (1, 1, 3, 'Occam''s Razor', 'Chercher l''erreur', '2004-11-16', '2008-03-12', 'Un étudiant tombe dans les pommes après avoir eu des relations...', NULL);
INSERT INTO ecrire(id_serie, num_saison, num_episode, id_scenariste) VALUES (1, 1, 3, 1);
INSERT INTO realiser(id_serie, num_saison, num_episode, id_realisateur) VALUES (1, 1, 3, 7);
INSERT INTO episode(id_serie, num_saison, num_episode, titre_original, titre_fr, date_diff_origine, date_diff_fr, resume, image) VALUES (1, 1, 4, 'Maternity', 'Panique à la maternité', '2004-11-16', '2008-03-12', 'Plusieurs bébés d''une maternité tombent malades...', NULL);
INSERT INTO ecrire(id_serie, num_saison, num_episode, id_scenariste) VALUES (1, 1, 4, 1);
INSERT INTO realiser(id_serie, num_saison, num_episode, id_realisateur) VALUES (1, 1, 4, 7);
INSERT INTO episode(id_serie, num_saison, num_episode, titre_original, titre_fr, date_diff_origine, date_diff_fr, resume, image) VALUES (1, 1, 5, 'Damned If You Do', 'Sœurs ennemies', '2004-11-16', '2008-03-12', 'Une nonne arrive aux urgences avec des stigmates...', NULL);
INSERT INTO ecrire(id_serie, num_saison, num_episode, id_scenariste) VALUES (1, 1, 5, 1);
INSERT INTO realiser(id_serie, num_saison, num_episode, id_realisateur) VALUES (1, 1, 5, 7);
INSERT INTO position_personnage(id_position, nom_position) VALUES ('chef','Chef du service des diagnostics'), ('assistant', 'Assistant'), ('patient', 'Patient');
INSERT INTO personnage(id_personnage, nom_personnage, description) VALUES 
(1, 'Dr Gregory House', 'Medecin pas comme les autres.'),
(2, 'Dr Lisa Cuddy', 'Directrice administrative de l''hôpital.'),
(3, 'Rebecca Adler', 'Institutrice de 29 ans.'),
(4, 'Dr Eric Foreman', 'Membre de l''équipe'),
(5, 'Dr Robert Chase', 'Membre de l''équipe'),
(6, 'Dr Allison Cameron', 'Immunologue'),
(7, 'Dr James Wilson', 'Oncologue et meilleur ami de House.'),
(8, 'Dr Remy Hadley', 'Alias Thirteen, interniste.'),
(9, 'Dr Chris Taub', 'Membre de l''equipe de diagnostic.'),
(10, 'Dr Lawrence Kutner', 'Membre de l''equipe de diagnostic.'),
(11, 'Dr Martha Masters', 'Etudiante brillante en medecine.'),
(12, 'Dr Jessica Adams', 'Membre de l''equipe de House.'),
(13, 'Dr Chi Park', 'Neurologue, membre de l''equipe de House.'),
(17, 'Dr Stacy Warner', 'Avocate et ancienne compagne de House.');
INSERT INTO avoir(id_personnage, id_position) VALUES 
(1, 'chef'),
(2, 'chef'),
(3, 'patient'),
(4, 'assistant'),
(5, 'assistant'),
(6, 'assistant'),
(7, 'assistant'),
(8, 'assistant'),
(9, 'assistant'),
(10, 'assistant'),
(11, 'assistant'),
(12, 'assistant'),
(13, 'assistant'),
(17, 'assistant');
INSERT INTO interpreter(id_personnage, id_serie, num_saison, num_episode, id_acteur, id_doubleur, est_guest_star) VALUES
(1, 1, 1, 1, 2, 2, FALSE),
(2, 1, 1, 1, 3, 2, FALSE),
(3, 1, 1, 1, 5, 2, TRUE);
INSERT INTO interpreter(id_personnage, id_serie, num_saison, num_episode, id_acteur, id_doubleur, est_guest_star) VALUES
(1, 1, 1, 2, 2, 2, FALSE),
(2, 1, 1, 2, 3, 2, FALSE);
INSERT INTO interpreter(id_personnage, id_serie, num_saison, num_episode, id_acteur, id_doubleur, est_guest_star) VALUES
(1, 1, 1, 3, 2, 2, FALSE),
(2, 1, 1, 3, 3, 2, FALSE);
INSERT INTO interpreter(id_personnage, id_serie, num_saison, num_episode, id_acteur, id_doubleur, est_guest_star) VALUES
(1, 1, 1, 4, 2, 2, FALSE),
(2, 1, 1, 4, 3, 2, FALSE);
INSERT INTO interpreter(id_personnage, id_serie, num_saison, num_episode, id_acteur, id_doubleur, est_guest_star) VALUES
(1, 1, 1, 5, 2, 2, FALSE),
(2, 1, 1, 5, 3, 2, FALSE);

-- UTILISATEURS --
INSERT INTO utilisateur (id_utilisateur, email, mdp, nom, prenom, adresse, cp, ville, tel) VALUES 
(1, 'jean.dupont@email.com', 'motdepasse', 'Dupont', 'Jean', '12 rue des Fleurs', '75001', 'Paris', '0102030405');
INSERT INTO moy_paiement (id_utilisateur, num_carte, date_expiration, cvv) VALUES 
(1, '1234567812345678', '12/28', '123');

-- Saisons manquantes
INSERT INTO saison(id_serie, num_saison, nb_episodes, date_debut_tournage, date_fin_tournage) VALUES
(1, 3, 24, '2006-01-01', '2006-12-31'),
(1, 4, 16, '2007-01-01', '2007-12-31'),
(1, 5, 24, '2008-01-01', '2008-12-31'),
(1, 6, 21, '2009-01-01', '2009-12-31'),
(1, 7, 23, '2010-01-01', '2010-12-31'),
(1, 8, 22, '2011-01-01', '2012-12-31')
;

-- Episodes manquants saison 1
INSERT INTO episode(id_serie, num_saison, num_episode, titre_original, titre_fr, date_diff_origine, date_diff_fr, resume, image) VALUES
(1, 1, 6, 'The Socratic Method', 'La methode socratique', NULL, NULL, NULL, NULL),
(1, 1, 7, 'Fidelity', 'Fidelite', NULL, NULL, NULL, NULL),
(1, 1, 8, 'Poison', 'Poison', NULL, NULL, NULL, NULL),
(1, 1, 9, 'DNR', 'DNR', NULL, NULL, NULL, NULL),
(1, 1, 10, 'Histories', 'Histoires', NULL, NULL, NULL, NULL),
(1, 1, 11, 'Detox', 'Detox', NULL, NULL, NULL, NULL),
(1, 1, 12, 'Sports Medicine', 'Medecine sportive', NULL, NULL, NULL, NULL),
(1, 1, 13, 'Cursed', 'Maudit', NULL, NULL, NULL, NULL),
(1, 1, 14, 'Control', 'Controle', NULL, NULL, NULL, NULL),
(1, 1, 15, 'Mob Rules', 'Regles de la mafia', NULL, NULL, NULL, NULL),
(1, 1, 16, 'Heavy', 'Lourds secrets', NULL, NULL, NULL, NULL),
(1, 1, 17, 'Role Model', 'Modele', NULL, NULL, NULL, NULL),
(1, 1, 18, 'Babies & Bathwater', 'Bebes et eau du bain', NULL, NULL, NULL, NULL),
(1, 1, 19, 'Kids', 'Enfants', NULL, NULL, NULL, NULL),
(1, 1, 20, 'Love Hurts', 'L''amour fait mal', NULL, NULL, NULL, NULL),
(1, 1, 21, 'Three Stories', 'Trois histoires', NULL, NULL, NULL, NULL),
(1, 1, 22, 'Honeymoon', 'Lune de miel', NULL, NULL, NULL, NULL)
;

-- Episodes saison 2 (24)
INSERT INTO episode(id_serie, num_saison, num_episode, titre_original, titre_fr, date_diff_origine, date_diff_fr, resume, image) VALUES
(1, 2, 1, 'Acceptance', 'Acceptation', NULL, NULL, NULL, NULL),
(1, 2, 2, 'Autopsy', 'Autopsie', NULL, NULL, NULL, NULL),
(1, 2, 3, 'Humpty Dumpty', 'Humpty Dumpty', NULL, NULL, NULL, NULL),
(1, 2, 4, 'TB or Not TB', 'TB or Not TB', NULL, NULL, NULL, NULL),
(1, 2, 5, 'Daddy''s Boy', 'Le fils a papa', NULL, NULL, NULL, NULL),
(1, 2, 6, 'Spin', 'Spin', NULL, NULL, NULL, NULL),
(1, 2, 7, 'Hunting', 'Chasse', NULL, NULL, NULL, NULL),
(1, 2, 8, 'The Mistake', 'L''erreur', NULL, NULL, NULL, NULL),
(1, 2, 9, 'Deception', 'Tromperie', NULL, NULL, NULL, NULL),
(1, 2, 10, 'Failure to Communicate', 'Defaut de communication', NULL, NULL, NULL, NULL),
(1, 2, 11, 'Need to Know', 'Besoin de savoir', NULL, NULL, NULL, NULL),
(1, 2, 12, 'Distractions', 'Distractions', NULL, NULL, NULL, NULL),
(1, 2, 13, 'Skin Deep', 'Sous la peau', NULL, NULL, NULL, NULL),
(1, 2, 14, 'Sex Kills', 'Le sexe tue', NULL, NULL, NULL, NULL),
(1, 2, 15, 'Clueless', 'Sans piste', NULL, NULL, NULL, NULL),
(1, 2, 16, 'Safe', 'Sain et sauf', NULL, NULL, NULL, NULL),
(1, 2, 17, 'All In', 'Tout miser', NULL, NULL, NULL, NULL),
(1, 2, 18, 'Sleeping Dogs Lie', 'Ne reveillez pas le chien', NULL, NULL, NULL, NULL),
(1, 2, 19, 'House vs. God', 'House contre Dieu', NULL, NULL, NULL, NULL),
(1, 2, 20, 'Euphoria Part 1', 'Euphorie - partie 1', NULL, NULL, NULL, NULL),
(1, 2, 21, 'Euphoria Part 2', 'Euphorie - partie 2', NULL, NULL, NULL, NULL),
(1, 2, 22, 'Forever', 'Pour toujours', NULL, NULL, NULL, NULL),
(1, 2, 23, 'Who''s Your Daddy?', 'Qui est ton pere ?', NULL, NULL, NULL, NULL),
(1, 2, 24, 'No Reason', 'Sans raison', NULL, NULL, NULL, NULL)
;

-- Episodes saison 3 (24)
INSERT INTO episode(id_serie, num_saison, num_episode, titre_original, titre_fr, date_diff_origine, date_diff_fr, resume, image) VALUES
(1, 3, 1, 'Meaning', 'Signification', NULL, NULL, NULL, NULL),
(1, 3, 2, 'Cane and Able', 'Canne et capable', NULL, NULL, NULL, NULL),
(1, 3, 3, 'Informed Consent', 'Consentement eclaire', NULL, NULL, NULL, NULL),
(1, 3, 4, 'Lines in the Sand', 'Lignes dans le sable', NULL, NULL, NULL, NULL),
(1, 3, 5, 'Fools for Love', 'Fous d''amour', NULL, NULL, NULL, NULL),
(1, 3, 6, 'Que Sera Sera', 'Que sera sera', NULL, NULL, NULL, NULL),
(1, 3, 7, 'Son of Coma Guy', 'Le fils du comateux', NULL, NULL, NULL, NULL),
(1, 3, 8, 'Whac-A-Mole', 'Whac-A-Mole', NULL, NULL, NULL, NULL),
(1, 3, 9, 'Finding Judas', 'Trouver Judas', NULL, NULL, NULL, NULL),
(1, 3, 10, 'Merry Little Christmas', 'Joyeux petit Noel', NULL, NULL, NULL, NULL),
(1, 3, 11, 'Words and Deeds', 'Mots et actes', NULL, NULL, NULL, NULL),
(1, 3, 12, 'One Day, One Room', 'Un jour, une chambre', NULL, NULL, NULL, NULL),
(1, 3, 13, 'Needle in a Haystack', 'Aiguille dans une botte de foin', NULL, NULL, NULL, NULL),
(1, 3, 14, 'Insensitive', 'Insensible', NULL, NULL, NULL, NULL),
(1, 3, 15, 'Half-Wit', 'Demi-esprit', NULL, NULL, NULL, NULL),
(1, 3, 16, 'Top Secret', 'Top secret', NULL, NULL, NULL, NULL),
(1, 3, 17, 'Fetal Position', 'Position foetale', NULL, NULL, NULL, NULL),
(1, 3, 18, 'Airborne', 'En vol', NULL, NULL, NULL, NULL),
(1, 3, 19, 'Act Your Age', 'Fais ton age', NULL, NULL, NULL, NULL),
(1, 3, 20, 'House Training', 'Dressage House', NULL, NULL, NULL, NULL),
(1, 3, 21, 'Family', 'Famille', NULL, NULL, NULL, NULL),
(1, 3, 22, 'Resignation', 'Demission', NULL, NULL, NULL, NULL),
(1, 3, 23, 'The Jerk', 'Le cretin', NULL, NULL, NULL, NULL),
(1, 3, 24, 'Human Error', 'Erreur humaine', NULL, NULL, NULL, NULL)
;

-- Episodes saison 4 (16)
INSERT INTO episode(id_serie, num_saison, num_episode, titre_original, titre_fr, date_diff_origine, date_diff_fr, resume, image) VALUES
(1, 4, 1, 'Alone', 'Seul', NULL, NULL, NULL, NULL),
(1, 4, 2, 'The Right Stuff', 'Le bon profil', NULL, NULL, NULL, NULL),
(1, 4, 3, '97 Seconds', '97 secondes', NULL, NULL, NULL, NULL),
(1, 4, 4, 'Guardian Angels', 'Anges gardiens', NULL, NULL, NULL, NULL),
(1, 4, 5, 'Mirror Mirror', 'Miroir miroir', NULL, NULL, NULL, NULL),
(1, 4, 6, 'Whatever It Takes', 'Quoi qu''il en coute', NULL, NULL, NULL, NULL),
(1, 4, 7, 'Ugly', 'Moche', NULL, NULL, NULL, NULL),
(1, 4, 8, 'You Don''t Want to Know', 'Tu ne veux pas savoir', NULL, NULL, NULL, NULL),
(1, 4, 9, 'Games', 'Jeux', NULL, NULL, NULL, NULL),
(1, 4, 10, 'It''s a Wonderful Lie', 'Un merveilleux mensonge', NULL, NULL, NULL, NULL),
(1, 4, 11, 'Frozen', 'Gelee', NULL, NULL, NULL, NULL),
(1, 4, 12, 'Don''t Ever Change', 'Ne change jamais', NULL, NULL, NULL, NULL),
(1, 4, 13, 'No More Mr. Nice Guy', 'Fini le gentil docteur', NULL, NULL, NULL, NULL),
(1, 4, 14, 'Living the Dream', 'Vivre le reve', NULL, NULL, NULL, NULL),
(1, 4, 15, 'House''s Head', 'La tete de House', NULL, NULL, NULL, NULL),
(1, 4, 16, 'Wilson''s Heart', 'Le coeur de Wilson', NULL, NULL, NULL, NULL)
;

-- Episodes saison 5 (24)
INSERT INTO episode(id_serie, num_saison, num_episode, titre_original, titre_fr, date_diff_origine, date_diff_fr, resume, image) VALUES
(1, 5, 1, 'Dying Changes Everything', 'Mourir change tout', NULL, NULL, NULL, NULL),
(1, 5, 2, 'Not Cancer', 'Pas un cancer', NULL, NULL, NULL, NULL),
(1, 5, 3, 'Adverse Events', 'Effets indesirables', NULL, NULL, NULL, NULL),
(1, 5, 4, 'Birthmarks', 'Taches de naissance', NULL, NULL, NULL, NULL),
(1, 5, 5, 'Lucky Thirteen', 'Chanceuse Treize', NULL, NULL, NULL, NULL),
(1, 5, 6, 'Joy to the World', 'Joie au monde', NULL, NULL, NULL, NULL),
(1, 5, 7, 'The Itch', 'Demangeaison', NULL, NULL, NULL, NULL),
(1, 5, 8, 'Emancipation', 'Emancipation', NULL, NULL, NULL, NULL),
(1, 5, 9, 'Last Resort', 'Dernier recours', NULL, NULL, NULL, NULL),
(1, 5, 10, 'Let Them Eat Cake', 'Qu''ils mangent de la brioche', NULL, NULL, NULL, NULL),
(1, 5, 11, 'Joy', 'Joie', NULL, NULL, NULL, NULL),
(1, 5, 12, 'Painless', 'Sans douleur', NULL, NULL, NULL, NULL),
(1, 5, 13, 'Big Baby', 'Gros bebe', NULL, NULL, NULL, NULL),
(1, 5, 14, 'The Greater Good', 'Le plus grand bien', NULL, NULL, NULL, NULL),
(1, 5, 15, 'Unfaithful', 'Infidele', NULL, NULL, NULL, NULL),
(1, 5, 16, 'The Softer Side', 'Le cote tendre', NULL, NULL, NULL, NULL),
(1, 5, 17, 'The Social Contract', 'Le contrat social', NULL, NULL, NULL, NULL),
(1, 5, 18, 'Here Kitty', 'Viens petit chat', NULL, NULL, NULL, NULL),
(1, 5, 19, 'Locked In', 'Enferme', NULL, NULL, NULL, NULL),
(1, 5, 20, 'Simple Explanation', 'Simple explication', NULL, NULL, NULL, NULL),
(1, 5, 21, 'Saviors', 'Sauveurs', NULL, NULL, NULL, NULL),
(1, 5, 22, 'House Divided', 'Maison divisee', NULL, NULL, NULL, NULL),
(1, 5, 23, 'Under My Skin', 'Sous ma peau', NULL, NULL, NULL, NULL),
(1, 5, 24, 'Both Sides Now', 'Les deux cotes', NULL, NULL, NULL, NULL)
;

-- Episodes saison 6 (21)
INSERT INTO episode(id_serie, num_saison, num_episode, titre_original, titre_fr, date_diff_origine, date_diff_fr, resume, image) VALUES
(1, 6, 1, 'Broken', 'Brise', NULL, NULL, NULL, NULL),
(1, 6, 2, 'Epic Fail', 'Echec epique', NULL, NULL, NULL, NULL),
(1, 6, 3, 'The Tyrant', 'Le tyran', NULL, NULL, NULL, NULL),
(1, 6, 4, 'Instant Karma', 'Karma instantane', NULL, NULL, NULL, NULL),
(1, 6, 5, 'Brave Heart', 'Coeur brave', NULL, NULL, NULL, NULL),
(1, 6, 6, 'Known Unknowns', 'Inconnus connus', NULL, NULL, NULL, NULL),
(1, 6, 7, 'Teamwork', 'Travail d''equipe', NULL, NULL, NULL, NULL),
(1, 6, 8, 'Ignorance Is Bliss', 'L''ignorance est un bonheur', NULL, NULL, NULL, NULL),
(1, 6, 9, 'Wilson', 'Wilson', NULL, NULL, NULL, NULL),
(1, 6, 10, 'The Down Low', 'Secret bien garde', NULL, NULL, NULL, NULL),
(1, 6, 11, 'Remorse', 'Remords', NULL, NULL, NULL, NULL),
(1, 6, 12, 'Moving the Chains', 'Faire avancer les choses', NULL, NULL, NULL, NULL),
(1, 6, 13, '5 to 9', '5 a 9', NULL, NULL, NULL, NULL),
(1, 6, 14, 'Private Lives', 'Vies privees', NULL, NULL, NULL, NULL),
(1, 6, 15, 'Black Hole', 'Trou noir', NULL, NULL, NULL, NULL),
(1, 6, 16, 'Lockdown', 'Confinement', NULL, NULL, NULL, NULL),
(1, 6, 17, 'Knight Fall', 'Chute du chevalier', NULL, NULL, NULL, NULL),
(1, 6, 18, 'Open and Shut', 'Ouvert et ferme', NULL, NULL, NULL, NULL),
(1, 6, 19, 'The Choice', 'Le choix', NULL, NULL, NULL, NULL),
(1, 6, 20, 'Baggage', 'Bagages', NULL, NULL, NULL, NULL),
(1, 6, 21, 'Help Me', 'Aidez-moi', NULL, NULL, NULL, NULL)
;

-- Episodes saison 7 (23)
INSERT INTO episode(id_serie, num_saison, num_episode, titre_original, titre_fr, date_diff_origine, date_diff_fr, resume, image) VALUES
(1, 7, 1, 'Now What?', 'Et maintenant ?', NULL, NULL, NULL, NULL),
(1, 7, 2, 'Selfish', 'Egoiste', NULL, NULL, NULL, NULL),
(1, 7, 3, 'Unwritten', 'Non ecrit', NULL, NULL, NULL, NULL),
(1, 7, 4, 'Massage Therapy', 'Massage therapie', NULL, NULL, NULL, NULL),
(1, 7, 5, 'Unplanned Parenthood', 'Parentalite imprevue', NULL, NULL, NULL, NULL),
(1, 7, 6, 'Office Politics', 'Politique de bureau', NULL, NULL, NULL, NULL),
(1, 7, 7, 'A Pox on Our House', 'Une variole chez nous', NULL, NULL, NULL, NULL),
(1, 7, 8, 'Small Sacrifices', 'Petits sacrifices', NULL, NULL, NULL, NULL),
(1, 7, 9, 'Larger Than Life', 'Plus grand que nature', NULL, NULL, NULL, NULL),
(1, 7, 10, 'Carrot or Stick', 'La carotte ou le baton', NULL, NULL, NULL, NULL),
(1, 7, 11, 'Family Practice', 'Pratique familiale', NULL, NULL, NULL, NULL),
(1, 7, 12, 'You Must Remember This', 'Tu dois te souvenir de ca', NULL, NULL, NULL, NULL),
(1, 7, 13, 'Two Stories', 'Deux histoires', NULL, NULL, NULL, NULL),
(1, 7, 14, 'Recession Proof', 'Anti-recession', NULL, NULL, NULL, NULL),
(1, 7, 15, 'Bombshells', 'Bombes', NULL, NULL, NULL, NULL),
(1, 7, 16, 'Out of the Chute', 'Sortie de piste', NULL, NULL, NULL, NULL),
(1, 7, 17, 'Fall from Grace', 'Chute de grace', NULL, NULL, NULL, NULL),
(1, 7, 18, 'The Dig', 'La fouille', NULL, NULL, NULL, NULL),
(1, 7, 19, 'Last Temptation', 'Derniere tentation', NULL, NULL, NULL, NULL),
(1, 7, 20, 'Changes', 'Changements', NULL, NULL, NULL, NULL),
(1, 7, 21, 'The Fix', 'La solution', NULL, NULL, NULL, NULL),
(1, 7, 22, 'After Hours', 'Apres les heures', NULL, NULL, NULL, NULL),
(1, 7, 23, 'Moving On', 'Aller de l''avant', NULL, NULL, NULL, NULL)
;

-- Episodes saison 8 (22)
INSERT INTO episode(id_serie, num_saison, num_episode, titre_original, titre_fr, date_diff_origine, date_diff_fr, resume, image) VALUES
(1, 8, 1, 'Twenty Vicodin', 'Vingt Vicodin', NULL, NULL, NULL, NULL),
(1, 8, 2, 'Transplant', 'Greffe', NULL, NULL, NULL, NULL),
(1, 8, 3, 'Charity Case', 'Cas de charite', NULL, NULL, NULL, NULL),
(1, 8, 4, 'Risky Business', 'Affaires risquees', NULL, NULL, NULL, NULL),
(1, 8, 5, 'The Confession', 'La confession', NULL, NULL, NULL, NULL),
(1, 8, 6, 'Parents', 'Parents', NULL, NULL, NULL, NULL),
(1, 8, 7, 'Dead & Buried', 'Mort et enterre', NULL, NULL, NULL, NULL),
(1, 8, 8, 'Perils of Paranoia', 'Perils de la paranoIa', NULL, NULL, NULL, NULL),
(1, 8, 9, 'Better Half', 'Meilleure moitie', NULL, NULL, NULL, NULL),
(1, 8, 10, 'Runaways', 'Fugitifs', NULL, NULL, NULL, NULL),
(1, 8, 11, 'Nobody''s Fault', 'La faute de personne', NULL, NULL, NULL, NULL),
(1, 8, 12, 'Chase', 'Chase', NULL, NULL, NULL, NULL),
(1, 8, 13, 'Man of the House', 'L''homme de la maison', NULL, NULL, NULL, NULL),
(1, 8, 14, 'Love Is Blind', 'L''amour est aveugle', NULL, NULL, NULL, NULL),
(1, 8, 15, 'Blowing the Whistle', 'Lanceur d''alerte', NULL, NULL, NULL, NULL),
(1, 8, 16, 'Gut Check', 'Test d''instinct', NULL, NULL, NULL, NULL),
(1, 8, 17, 'We Need the Eggs', 'Il nous faut les ovules', NULL, NULL, NULL, NULL),
(1, 8, 18, 'Body & Soul', 'Corps et ame', NULL, NULL, NULL, NULL),
(1, 8, 19, 'The C Word', 'Le mot en C', NULL, NULL, NULL, NULL),
(1, 8, 20, 'Post Mortem', 'Post mortem', NULL, NULL, NULL, NULL),
(1, 8, 21, 'Holding On', 'Tenir bon', NULL, NULL, NULL, NULL),
(1, 8, 22, 'Everybody Dies', 'Tout le monde meurt', NULL, NULL, NULL, NULL)
;

-- Completer les descriptions manquantes sans ajouter de nouveaux INSERT
UPDATE episode
SET resume = 'Cas medical traite par l''equipe du Dr House.'
WHERE id_serie = 1
	AND (resume IS NULL OR BTRIM(resume) = '');
