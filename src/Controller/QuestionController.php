<?php

namespace App\Controller;

use App\Model\QuizManager;
use App\Model\ThemeManager;
use App\Model\QuestionManager;
use App\Model\AnswerManager;

class QuestionController extends AbstractController
{

    public function browse(int $id, int $idQuestion)
    {
        if ($_SESSION['id_question'] < $_SESSION['nbQuestion'] + 1) {
            $quizManager = new QuestionManager();
            $questions = $quizManager->selectOneByQuiz($id, $idQuestion);
            $idQuestion2 = $questions;
            $idQuestion2['id'] = intval($idQuestion2['id']);
            $answerManager = new AnswerManager();
            $answers = $answerManager->selectAllByQuestion($idQuestion2['id'], $id);
            $_SESSION['id_question'] = $_SESSION['id_question'] + 1;
            return $this->twig->render('Quiz/read.html.twig', [
                'questions' => $questions,
                'answers' => $answers, 'session' => $_SESSION
            ]);
        } else {
            header('location:/result');
        }
    }
    public function start($id)
    {
        $_SESSION['id_quiz'] = intval($_POST['quiz']);
        $_SESSION['id_question'] = 1;
        $_SESSION['good_answer'] = 0;
        $questionManager = new QuestionManager();
        $_SESSION['nbQuestion'] = $questionManager->nbQuestion($id);
        header('location:/theme/quiz/play');
    }
    public function good()
    {
        $_SESSION['true'] = intval($_POST['true']);
        if ($_SESSION['true'] === 1) {
            $_SESSION['good_answer'] = $_SESSION['good_answer'] + 1;
            header('location:/theme/quiz/play');
        } else {
            header('location:/theme/quiz/play');
        }
    }
    public function result()
    {
        $questionManager = new QuestionManager();
        $results = $questionManager->result($_SESSION['id_quiz']);
        return $this->twig->render('Quiz/result.html.twig', ['results' => $results, 'session' => $_SESSION]);
    }
    public function add()
    {
        $questionManager = new QuestionManager();
        $answerManager = new AnswerManager();
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $imageDir = realpath("./") . "/assets/images/upload/";

            $image = basename($_FILES['image']['name']);
            $uploadFile = $imageDir . $image;
            move_uploaded_file($_FILES['image']['tmp_name'], $uploadFile);
            $question = [
                'name' => $_POST['question'],
                'image' => $image,
                'id_quiz' => $_SESSION['id'],
                'nb_question' => $_SESSION['count']
            ];
            $_SESSION['count'] = $_SESSION['count'] + 1;
            $id = (int)$questionManager->insert($question);
            $test = [];
            $test[] = $_POST['answer1'];
            $test[] = $_POST['answer2'];
            $test[] = $_POST['answer3'];
            $test[] = $_POST['answer4'];
            if ($_POST['nb_answer'] === "2") {
                $nbAnswer = 2;
            } else {
                $nbAnswer = 4;
            }
            for ($i = 0; $i < $nbAnswer; $i++) {
                if ($_POST['result'] == $i + 1) {
                    $answer = [
                        'name' => $test[$i],
                        'result' => 1,
                        'id_question' => $id,
                        'id_quizs' => $_SESSION['id']
                    ];
                } else {
                    $answer = [
                        'name' => $test[$i],
                        'result' => 0,
                        'id_question' => $id,
                        'id_quizs' => $_SESSION['id']
                    ];
                }
                $answerManager->insert($answer);
            }
        }
        return $this->twig->render('Quiz/create2.html.twig');
    }
    public function edit()
    {
        $questionManager = new QuestionManager();
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $questionManager->delete($_POST['supprimer']);
        }
        $_SESSION['quizId'] = $_GET['editer'];
        $questions = $questionManager->selectAllQuestion($_GET['editer']);
        return $this->twig->render('Quiz/question.html.twig', ['questions' => $questions]);
    }
    public function update()
    {
        $questionManager = new QuestionManager();
        $answerManager = new AnswerManager();

        $question = $questionManager->selectOne($_SESSION['quizId'], $_GET['edit']);
        $answers = $answerManager->selectAllByQuestion($_GET['edit'], $_SESSION['quizId']);
        return $this->twig->render('Quiz/edit.html.twig', ['question' => $question, 'answers' => $answers]);
    }
    public function update2()
    {
        $questionManager = new QuestionManager();
        $answerManager = new AnswerManager();
        $imageDir = realpath("./") . "/assets/images/";

        $image = basename($_FILES['image']['name']);
        $uploadFile = $imageDir . $image;
        move_uploaded_file($_FILES['image']['tmp_name'], $uploadFile);
        $question = [
            'name' => $_POST['question'],
            'image' => $image,
            'id' => $_GET['question']
        ];
        $questionManager->update($question);
        if ($_POST['nb_answer'] === "2") {
            $nbAnswer = 2;
        } else {
            $nbAnswer = 4;
        }
        for ($i = 1; $i <= $nbAnswer; $i++) {
            if ($_POST['result'] == $i) {
                $result = 1;
            } else {
                $result = 0;
            }
            $answer = [
                'name' => $_POST['answer' . $i],
                'result' => $result,
                'id' => $_POST['idAnswer' . $i]
            ];
            $answerManager->update($answer);
        }
        header('location:/edit?editer=' . $_SESSION['quizId']);
    }
}
