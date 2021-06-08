<?php

namespace App\Controller\Admin;

use App\Entity\Post;
use App\Entity\Comment;
use App\Entity\User;
use EasyCorp\Bundle\EasyAdminBundle\Router\CrudUrlGenerator;
use EasyCorp\Bundle\EasyAdminBundle\Config\Dashboard;
use EasyCorp\Bundle\EasyAdminBundle\Config\MenuItem;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractDashboardController;

class BlogAdminController extends AbstractDashboardController
{
    /**
     * @Route("/admin", name="admin")
     */
    public function index(): Response
    {
        $routeBuilder = $this->get(CrudUrlGenerator::class)->build();

        return $this->redirect($routeBuilder->setController(PostCrudController::class)->generateUrl());
    }

    public function configureDashboard(): Dashboard
    {
        return Dashboard::new()
            ->setTitle('Lab4');
    }

    public function configureMenuItems(): iterable
    {
        yield MenuItem::linkToUrl('Visit public website', 'fas fa-home', '/');
        yield MenuItem::section('Blog');
        yield MenuItem::linkToCrud('Posts', 'fas fa-list', Post::class);
        yield MenuItem::linkToCrud('Comments', 'fas fa-comments', Comment::class);
        yield MenuItem::linkToCrud('Users', 'fas fa-user', User::class);
    }
}
