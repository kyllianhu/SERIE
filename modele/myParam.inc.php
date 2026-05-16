<?php
// Paramètres de connexion à la base de données PostgreSQL
define("HOST",   "127.0.0.1");
define("DBNAME", "BDSERIE");
define("USER",   "");
define("PASS",   "");

// Ouvre et retourne une connexion PDO à la base de données
function getConnexion() {
    try {
        $pdo = new PDO("pgsql:host=" . HOST . ";dbname=" . DBNAME, USER, PASS);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        return $pdo;
    } catch (PDOException $e) {
        die("Erreur de connexion : " . $e->getMessage());
    }
}
?>
