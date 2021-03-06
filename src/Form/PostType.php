<?php

namespace App\Form;

use App\Entity\Post;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TextType;

class PostType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('title', TextType::class, [
                'attr' => ['class'=> 'form-control', 'placeholder'=> "Header"]
            ])
            ->add('content', TextareaType::class, [
                'attr' => ['class'=> 'form-control', 'placeholder'=> "Content", 'style'=> 'height: 200px']
            ])
            ->add('short_content', TextType::class, [
                'attr' => ['class'=> 'form-control', 'placeholder'=> "Short content"]
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Post::class,
        ]);
    }
}
