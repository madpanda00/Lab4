<?php

namespace App\Controller;

use App\Entity\Post;
use App\Entity\User;
use App\Entity\Comment;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\ORM\Tools\Pagination\Paginator;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class ListController extends AbstractController
{
    /**
     * @Route("/list", name="list")
     */
    public function index(EntityManagerInterface $em, Request $request, PaginatorInterface $paginator): Response
    {
        $listPosts = $em->getRepository(Post::class)->findBy([], ['created_at' => 'DESC']);
        $posts = $paginator->paginate(
            $listPosts,
            $request->query->get('page', 1), 5
        );

        return $this->render('list/index.html.twig', [
            'listPosts' => $posts,
        ]);
    }
}
