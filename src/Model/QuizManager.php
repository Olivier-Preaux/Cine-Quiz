<?php

namespace App\Model;

class QuizManager extends AbstractManager
{
    private const TABLE = 'quiz';

    public function __construct()
    {
        parent::__construct(self::TABLE);
    }

    public function selectOneByTheme(int $themeid)
    {
        $statement = $this->pdo->prepare("SELECT * FROM $this->table WHERE id_theme=:id_theme");
        $statement->bindValue(':id_theme', $themeid, \PDO::PARAM_INT);
        $statement->execute();
        $quizs = $statement->fetchAll();

        return $quizs;
    }
    public function insert(array $quiz)
    {
        $statement = $this->pdo->prepare(
            "INSERT INTO " . self::TABLE .
            " (`name`, `id_theme`) VALUES (:name, :id_theme)"
        );
        $statement->bindValue(':name', $quiz['name'], \PDO::PARAM_STR);
        $statement->bindValue(':id_theme', $quiz['id_theme'], \PDO::PARAM_STR);
        if ($statement->execute()) {
            return (int)$this->pdo->lastInsertId();
        }
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
}
