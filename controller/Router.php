<?php
require_once __DIR__ . '/AuthController.php';
require_once __DIR__ . '/SerieController.php';

class Router {
    private $authController;
    private $serieController;

    public function __construct() {
        $this->authController = new AuthController();
        $this->serieController = new SerieController();
    }

    public function routeReq() {
        $action = $_GET['action'] ?? $_POST['action'] ?? 'login';

        // Protection des routes
        $protectedActions = ['series', 'serie', 'saisons', 'episode', 'personnages'];
        if (in_array($action, $protectedActions) && !isset($_SESSION['id_utilisateur'])) {
            header('Location: index.php');
            exit;
        }

        // Routage
        switch ($action) {
            case 'login':       $this->authController->login(); break;
            case 'register':    $this->authController->register(); break;
            case 'paiement':    $this->authController->paiement(); break;
            
            case 'series':      $this->serieController->series(); break;
            case 'serie':       $this->serieController->serie(); break;
            case 'saisons':     $this->serieController->saisons(); break;
            case 'episode':     $this->serieController->episode(); break;
            case 'personnages': $this->serieController->personnages(); break;
            
            default:            $this->authController->login(); break;
        }
    }
}