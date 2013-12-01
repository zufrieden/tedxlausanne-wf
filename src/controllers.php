<?php

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;





$app->get('/', function () use ($app) {
    return $app['twig']->render('index.html.twig', array());
})
->bind('homepage');

// EVENTs
$app->get('/events', function () use ($app) {
    return $app['twig']->render('events.html.twig', array());
})
->bind('events')
$app->get('/events/tedxlausanne2014', function () use ($app) {
    return $app['twig']->render('event2014.html.twig', array());
})
->bind('event2014');
$app->get('/events/tedxlausanne2014/speakers', function () use ($app) {
    return $app['twig']->render('event2014-speakers.html.twig', array());
})
->bind('event2014-speakers');
$app->get('/events/tedxlausanne2014/venue', function () use ($app) {
    return $app['twig']->render('event2014-venue.html.twig', array());
})
->bind('event2014-venue');




$app->error(function (\Exception $e, $code) use ($app) {
    if ($app['debug']) {
        return;
    }

    $page = 404 == $code ? '404.html.twig' : '500.html.twig';

    return new Response($app['twig']->render($page, array('code' => $code)), $code);
});
