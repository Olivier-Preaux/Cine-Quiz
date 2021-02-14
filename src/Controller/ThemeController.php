<?php

namespace App\Controller;

use App\Model\QuizManager;
use App\Model\ThemeManager;

class ThemeController extends AbstractController
{

    public function browse()
    {
        $themeManager = new ThemeManager();
        $themes = $themeManager->selectAll();

        return $this->twig->render('Quiz/theme.html.twig', ['themes' => $themes]);
    }

    public function create()
    {
        return $this->twig->render('Quiz/create.html.twig');
    }
}
