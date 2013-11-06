<?php

require_once '../vendor/autoload.php';

$loader = new Twig_Loader_String();
$loader = new Twig_Loader_Filesystem('../app/templates');

$twig = new Twig_Environment($loader);

// @todo add cache
// $twig = new Twig_Environment($loader, array(
//     'cache' => '../app/cache',
// ));

echo $twig->render('index.html.twig');