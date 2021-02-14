<?php

namespace App\Model;

class QuestionManager extends AbstractManager
{
    private const TABLE = 'question';

    public function __construct()
    {
        parent::__construct(self::TABLE);
    }

    public function selectOneByQuiz(int $id, int $idQuestion)
    {
        $statement = $this->pdo->prepare("SELECT * FROM $this->table" .
        " WHERE id_quiz=:id_quiz AND nb_question=:nb_question");
        $statement->bindValue(':id_quiz', $id, \PDO::PARAM_INT);
        $statement->bindValue(':nb_question', $idQuestion, \PDO::PARAM_INT);
        $statement->execute();
        $question = $statement->fetch();

        return $question;
    }
    public function nbQuestion(int $id)
    {
        $statement = $this->pdo->prepare("SELECT nb_question FROM $this->table" .
        " WHERE id_quiz=:id_quiz ORDER BY nb_question DESC LIMIT 0,1");
        $statement->bindValue(':id_quiz', $id, \PDO::PARAM_INT);
        $statement->execute();
        $test = $statement->fetch();
        $test['nb_question'] = intval($test['nb_question']);
        return $test['nb_question'];
    }
    public function result(int $idQuiz)
    {
        $statement = $this->pdo->prepare("SELECT question.name AS question, question.nb_question," .
        " answer.name AS answer FROM $this->table" .
        " JOIN answer ON question.id=answer.id_question" .
        " WHERE answer.result=1 AND id_quiz=:id_quiz");
        $statement->bindValue(':id_quiz', $idQuiz, \PDO::PARAM_INT);
        $statement->execute();
        $result = $statement->fetchAll();
        return $result;
    }
    public function insert(array $question)
    {
        $statement = $this->pdo->prepare("
            INSERT INTO " . self::TABLE .
            " (`name`, `image`, `id_quiz`, `nb_question`) VALUES" .
            " (:name, :image, :id_quiz, :nb_question)");
        $statement->bindValue(':name', $question['name'], \PDO::PARAM_STR);
        $statement->bindValue(':image', $question['image'], \PDO::PARAM_STR);
        $statement->bindValue(':id_quiz', $question['id_quiz'], \PDO::PARAM_INT);
        $statement->bindValue(':nb_question', $question['nb_question'], \PDO::PARAM_INT);
        if ($statement->execute()) {
            return (int)$this->pdo->lastInsertId();
        }
    }
    public function selectAllQuestion(int $id)
    {
        $statement = $this->pdo->prepare(
            "SELECT * FROM " . self::TABLE .
            " WHERE id_quiz=:id_quiz"
        );
        $statement->bindValue(':id_quiz', $id, \PDO::PARAM_INT);
        $statement->execute();
        $questions = $statement->fetchAll();
        return $questions;
    }
    public function delete(int $id)
    {
        $statement = $this->pdo->prepare(
            "DELETE FROM " . self::TABLE .
            " WHERE id = :id"
        );
        $statement->bindValue(':id', $id, \PDO::PARAM_INT);
        $statement->execute();
    }
    public function update(array $question)
    {
        $statement = $this->pdo->prepare(
            "UPDATE " . self::TABLE .
            " SET `name`=:name, `image`=:image" .
            " WHERE id=:id"
        );
        $statement->bindValue(':name', $question['name'], \PDO::PARAM_STR);
        $statement->bindValue(':image', $question['image'], \PDO::PARAM_STR);
        $statement->bindValue(':id', $question['id'], \PDO::PARAM_INT);
        $statement->execute();
    }
    public function selectOne(int $id, int $idQuestion)
    {
        $statement = $this->pdo->prepare("SELECT * FROM $this->table" .
        " WHERE id_quiz=:id_quiz AND id=:id");
        $statement->bindValue(':id_quiz', $id, \PDO::PARAM_INT);
        $statement->bindValue(':id', $idQuestion, \PDO::PARAM_INT);
        $statement->execute();
        $question = $statement->fetch();

        return $question;
    }
}
