<?php

namespace App\Model;

class AnswerManager extends AbstractManager
{
    private const TABLE = 'answer';

    public function __construct()
    {
        parent::__construct(self::TABLE);
    }

    public function selectAllByQuestion(int $questionId, int $idQuiz)
    {
        $statement = $this->pdo->prepare("SELECT * FROM $this->table WHERE 
        id_question=:id_question AND id_quizs=:id_quizs");
        $statement->bindValue(':id_question', $questionId, \PDO::PARAM_INT);
        $statement->bindValue(':id_quizs', $idQuiz, \PDO::PARAM_INT);
        $statement->execute();
        $answer = $statement->fetchAll();

        return $answer;
    }
    public function insert(array $answer)
    {
        $statement = $this->pdo->prepare(
            "INSERT INTO " . self::TABLE .
            " (`name`, `result`, `id_question`, `id_quizs`) VALUES" .
            " (:name, :result, :id_question, :id_quizs)"
        );
        $statement->bindValue(':name', $answer['name'], \PDO::PARAM_STR);
        $statement->bindValue(':result', $answer['result'], \PDO::PARAM_INT);
        $statement->bindValue(':id_question', $answer['id_question'], \PDO::PARAM_INT);
        $statement->bindValue(':id_quizs', $answer['id_quizs'], \PDO::PARAM_INT);
        $statement->execute();
    }
    public function update(array $answer)
    {
        $statement = $this->pdo->prepare(
            "UPDATE " . self::TABLE .
            " SET `name`=:name, `result`=:result" .
            " WHERE id=:id"
        );
        $statement->bindValue(':name', $answer['name'], \PDO::PARAM_STR);
        $statement->bindValue(':result', $answer['result'], \PDO::PARAM_STR);
        $statement->bindValue(':id', $answer['id'], \PDO::PARAM_STR);
        $statement->execute();
    }
}
