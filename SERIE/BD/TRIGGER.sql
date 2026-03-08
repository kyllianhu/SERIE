CREATE OR REPLACE FUNCTION verifUtilisateur_unique_email_mdp()
RETURNS trigger AS $$
BEGIN
  IF TG_OP = 'INSERT' THEN
    IF EXISTS (SELECT 1 FROM utilisateur WHERE email = NEW.email AND mdp = NEW.mdp) THEN
      RAISE EXCEPTION 'Un utilisateur avec le même identifiant et mot de passe existe déjà';
    END IF;
    RETURN NEW;
  ELSIF TG_OP = 'UPDATE' THEN
    IF EXISTS (SELECT 1 FROM utilisateur WHERE email = NEW.email AND mdp = NEW.mdp AND id_utilisateur <> OLD.id_utilisateur) THEN
      RAISE EXCEPTION 'Un utilisateur avec le même identifiant et mot de passe existe déjà';
    END IF;
    RETURN NEW;
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS verifUtilisateur ON utilisateur;
CREATE TRIGGER verifUtilisateur
BEFORE INSERT OR UPDATE ON utilisateur
FOR EACH ROW
EXECUTE FUNCTION verifUtilisateur_unique_email_mdp();
