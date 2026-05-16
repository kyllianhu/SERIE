<?php
require_once __DIR__ . '/../modele/myParam.inc.php';
require_once __DIR__ . '/../modele/utilisateur.php';
require_once __DIR__ . '/../modele/utilisateurBDD.php';
require_once __DIR__ . '/../modele/moyPaiement.php';
require_once __DIR__ . '/../modele/moyPaiementBDD.php';

class AuthController {
    public function login() {
        $erreur  = '';
        $success = '';
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $email = trim($_POST['email']);
            $mdp   = $_POST['mdp'];
            $user  = verifierConnexion($email, $mdp);
            if ($user) {
                $_SESSION['id_utilisateur'] = $user['id_utilisateur'];
                header('Location: index.php?action=series');
                exit;
            } else {
                $erreur = 'Identifiant ou mot de passe incorrect.';
            }
        }
        require __DIR__ . '/../vue/login.php';
    }

    public function register() {
        $erreur  = '';
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $email      = trim($_POST['email']);
            $mdp        = $_POST['mdp'];
            $mdpConfirm = $_POST['mdp_confirm'];
            if ($mdp !== $mdpConfirm) {
                $erreur = 'Les mots de passe ne correspondent pas.';
            } elseif (strlen($mdp) < 4 || strlen($mdp) > 60) {
                $erreur = 'Le mot de passe doit contenir entre 4 et 60 caractères.';
            } else {
                $_SESSION['register_email'] = $email;
                $_SESSION['register_mdp']   = $mdp;
                header('Location: index.php?action=paiement');
                exit;
            }
        }
        require __DIR__ . '/../vue/register.php';
    }

    public function paiement() {
        $erreur  = '';
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            try {
                $email = $_SESSION['register_email'];
                $mdp   = $_SESSION['register_mdp'];
                $mdpHash = hash('sha256', $mdp);
                $id = insererUtilisateur(
                    $email, $mdpHash, $_POST['nom'], $_POST['prenom'], 
                    $_POST['adresse'], $_POST['cp'], $_POST['ville'], $_POST['tel']
                );
                
                $paiement = new MoyPaiement(
                    $_POST['num_carte'], $_POST['mois'] . '/' . $_POST['annee'], $_POST['cvv']
                );
                insererMoyPaiement($id, $paiement);
                
                $_SESSION['id_utilisateur'] = $id;
                unset($_SESSION['register_email'], $_SESSION['register_mdp']);
                header('Location: index.php?action=series');
                exit;
            } catch (Exception $e) {
                $erreur = 'Erreur lors de l\'inscription : ' . $e->getMessage();
            }
        }
        require __DIR__ . '/../vue/paiement.php';
    }
}