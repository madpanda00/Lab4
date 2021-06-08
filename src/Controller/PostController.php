<?php

namespace App\Controller;

use App\Entity\Post;
use App\Entity\Comment;
use App\Form\PostType;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class PostController extends AbstractController
{
    /**
     * @Route("/post/{slug}", name="post", requirements={"slug"="\d+"})
     */
    public function index(Post $slug): Response
    {
        $slug->setViews($slug->getViews()+1);

        $em = $this->getDoctrine()->getManager();

        $listComments = $em->getRepository(Comment::class)->findBy(['post' => $slug], ['create_at' => 'DESC']);

        $em->persist($slug);
        $em->flush();
        
        return $this->render('post/index.html.twig', [
            'post' => $slug,
            'listComments' => $listComments,
        ]);
    }

    /**
     * @Route("/post/create", name="createPost")
     */
    public function createPost(Request $request): Response
    {
        if(!$this->getUser()){
            return $this->redirectToRoute('list');
        }

        $post = new Post();

        $form = $this->createForm(PostType::class, $post);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $userId = $this->getUser();
                
            $post = $form->getData();
            $post->setCreatedAt(new \DateTime('now'));
            $post->setUser($userId);
            
            $em = $this->getDoctrine()->getManager();
            $em->persist($post);
            $em->flush();
    
            return $this->redirectToRoute('post', ['slug' => $post->getId()]);
        }
        
        return $this->render('post/createPost.html.twig', [
            'form' => $form->createView(),
        ]);
    }
}
