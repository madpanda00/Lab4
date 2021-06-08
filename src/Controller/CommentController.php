<?php

namespace App\Controller;

use App\Entity\Post;
use App\Entity\Comment;
use App\Form\CommentType;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class CommentController extends AbstractController
{
    /**
     * @Route("/comment/create/{slug}", name="createComment")
     */
    public function index(Post $slug, Request $request): Response
    {
        $comment = new Comment();

        $form = $this->createForm(CommentType::class, $comment, [
            'action' => $this->generateUrl('createComment', [
                'slug' => $slug->getId()
            ]),
            'method' => 'POST',
        ]);
        
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $userName = $this->getUser();
                
            $comment = $form->getData();
            $comment->setCreateAt(new \DateTime('now'));
            $comment->setPost($slug);
            $comment->setUser($userName);
            
            $em = $this->getDoctrine()->getManager();
            $em->persist($comment);
            $em->flush();
    
            return $this->redirectToRoute('post', ['slug' => $slug->getId()]);
        }

        return $this->render('comment/index.html.twig', [
            'form' => $form->createView(),
            'post' => $slug,
        ]);
    }
}
