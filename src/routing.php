<?php

/**
 * This file dispatch routes.
 *
 * PHP version 7
 *
 * @author   WCS <contact@wildcodeschool.fr>
 *
 * @link     https://github.com/WildCodeSchool/simple-mvc
 */

use App\Controller\HomeController;
use App\Controller\QuizController;
use App\Controller\ThemeController;
use App\Controller\QuestionController;

$urlPath = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);

if ('/' === $urlPath) {
    /*
     * home page
     */
    echo (new HomeController())->index();
} elseif ('/theme' === substr($urlPath, 0, strlen('/theme'))) {
    if ('/theme' === $urlPath) {
        $themeController = new ThemeController();
        echo $themeController->browse();
    } elseif ('/theme/quiz' === $urlPath) {
        $quizController = new QuizController();
        $quizController->session();
        echo $quizController->browse($_SESSION['id_theme']);
    } elseif ('/theme/quiz/play' === $urlPath) {
        $questionController = new QuestionController();
        echo $questionController->browse($_SESSION['id_quiz'], $_SESSION['id_question']);
    }
} elseif ('/create' === $urlPath) {
    $quizController = new QuizController();
    echo $quizController->create();
} elseif ('/play' === $urlPath) {
    $questionController = new QuestionController();
    $questionController->start($_POST['quiz']);
} elseif ('/good' === $urlPath) {
    $questionController = new QuestionController();
    $questionController->good();
} elseif ('/result' === $urlPath) {
    $questionController = new QuestionController();
    echo $questionController->result();
} elseif ('/create2' === $urlPath) {
    $questionController = new QuestionController();
    echo $questionController->add();
} elseif ('/quiz' === $urlPath) {
    $quizController = new QuizController();
    echo $quizController->selectAll();
} elseif ('/edit' === $urlPath) {
    $questionController = new QuestionController();
    echo $questionController->edit();
} elseif ('/edit2' === $urlPath) {
    $questionController = new QuestionController();
    echo $questionController->update();
} elseif ('/update' === $urlPath) {
    $questionController = new QuestionController();
    echo $questionController->update2();
} else {
    header('HTTP/1.1 404 Not Found');
}
