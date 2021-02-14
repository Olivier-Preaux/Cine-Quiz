<?php

namespace App\Controller;

use App\Model\QuizManager;
use App\Model\ThemeManager;

class QuizController extends AbstractController
{

    public function browse(int $id)
    {
        $quizManager = new QuizManager();
        $quizs = $quizManager->selectOneByTheme($id);

        return $this->twig->render('Quiz/quiz.html.twig', ['quizs' => $quizs]);
    }

    public function session()
    {
        $_SESSION['id_theme'] = intval($_POST['theme']);
    }

    public function create()
    {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $quizManager = new QuizManager();
            $quiz = [
                'name' => $_POST['quiz'],
                'id_theme' => $_POST['theme']
            ];
            $_SESSION['id'] = $quizManager->insert($quiz);
            $_SESSION['count'] = 1;
            header('location:/create2');
        }
        return $this->twig->render('Quiz/create.html.twig');
    }
    public function selectAll()
    {
        $quizManager = new QuizManager();
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $quizManager->delete($_POST['delete']);
        }
        $quizs = $quizManager->selectAll();
        return $this->twig->render('Quiz/allQuiz.html.twig', ['quizs' => $quizs]);
    }
}
