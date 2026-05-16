<?php
session_start();

require_once __DIR__ . '/../controller/Router.php';

$router = new Router();
$router->routeReq();
?>