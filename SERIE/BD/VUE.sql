CREATE OR REPLACE VIEW annexe1Vue AS
SELECT
    s.id_serie,
    s.image,
    s.titre_fr
FROM serie s;

CREATE VIEW annexe2Vue AS
SELECT
    ct.id_chaine AS numero_chaine,
    ct.nom_chaine,
    p.id_pays AS numero_pays,
    p.nom_pays AS pays
FROM chaine_tv ct
JOIN pays p ON ct.id_pays = p.id_pays
ORDER BY ct.id_chaine;

CREATE VIEW annexe3Vue AS
SELECT
    s.titre_fr AS titre_serie,
    sa.num_saison,
    sa.nb_episodes,
    sa.date_debut_tournage,
    sa.date_fin_tournage,
    per.nom AS producteur_nom,
    per.prenom AS producteur_prenom,
    e.num_episode,
    e.titre_original AS episode_titre_original,
    e.titre_fr AS episode_titre_fr,
    e.resume AS episode_resume
FROM serie s
JOIN saison sa ON s.id_serie = sa.id_serie
JOIN episode e ON sa.id_serie = e.id_serie
    AND sa.num_saison = e.num_saison
JOIN produire pr ON s.id_serie = pr.id_serie
JOIN producteur pd ON pr.id_producteur = pd.id_producteur
JOIN personne per ON pd.id_producteur = per.id_personne;

CREATE VIEW annexe4Vue AS
SELECT
    s.titre_fr AS titre_serie,
    sa.num_saison,
    e.num_episode,
    e.titre_original,
    e.titre_fr AS titre_fr_episode,
    e.date_diff_fr,
    e.date_diff_origine,
    e.resume,
    per_sc.nom AS scenariste_nom,
    per_sc.prenom AS scenariste_prenom,
    per_re.nom AS realisateur_nom,
    per_re.prenom AS realisateur_prenom,
    per_act.nom AS guest_star_nom,
    per_act.prenom AS guest_star_prenom,
    pg.nom_personnage AS guest_star_personnage
FROM serie s
JOIN saison sa ON s.id_serie = sa.id_serie
JOIN episode e ON sa.id_serie = e.id_serie
    AND sa.num_saison = e.num_saison
JOIN ecrire ec ON e.id_serie = ec.id_serie
    AND e.num_saison = ec.num_saison
    AND e.num_episode = ec.num_episode
JOIN scenariste sc ON ec.id_scenariste = sc.id_scenariste
JOIN personne per_sc ON sc.id_scenariste = per_sc.id_personne
JOIN realiser r ON e.id_serie = r.id_serie
    AND e.num_saison = r.num_saison
    AND e.num_episode = r.num_episode
JOIN realisateur re ON r.id_realisateur = re.id_realisateur
JOIN personne per_re ON re.id_realisateur = per_re.id_personne
JOIN interpreter i ON e.id_serie = i.id_serie
    AND e.num_saison = i.num_saison
    AND e.num_episode = i.num_episode
    AND i.est_guest_star = TRUE
JOIN acteur a ON i.id_acteur = a.id_acteur
JOIN personne per_act ON a.id_acteur = per_act.id_personne
JOIN personnage pg ON i.id_personnage = pg.id_personnage;

CREATE VIEW annexe5Vue AS
SELECT
    s.titre_fr AS titre_serie,
    pg.nom_personnage,
    pp.nom_position AS position,
    pg.description,
    e.num_saison,
    e.num_episode,
    per_act.nom AS acteur_nom,
    per_act.prenom AS acteur_prenom,
    per_dbl.nom AS doubleur_nom,
    per_dbl.prenom AS doubleur_prenom
FROM personnage pg
JOIN avoir av ON pg.id_personnage = av.id_personnage
JOIN position_personnage pp ON av.id_position = pp.id_position
JOIN interpreter i ON pg.id_personnage = i.id_personnage
JOIN serie s ON i.id_serie = s.id_serie
JOIN episode e ON i.id_serie = e.id_serie
    AND i.num_saison = e.num_saison
    AND i.num_episode = e.num_episode
JOIN acteur a ON i.id_acteur = a.id_acteur
JOIN personne per_act ON a.id_acteur = per_act.id_personne
LEFT JOIN doubleur d ON i.id_doubleur = d.id_doubleur
LEFT JOIN personne per_dbl ON d.id_doubleur = per_dbl.id_personne
ORDER BY pg.nom_personnage, e.num_saison, e.num_episode;
