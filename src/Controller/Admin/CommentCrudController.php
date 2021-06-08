<?php

namespace App\Controller\Admin;

use App\Entity\Comment;
use EasyCorp\Bundle\EasyAdminBundle\Config\Crud;
use EasyCorp\Bundle\EasyAdminBundle\Config\Actions;
use EasyCorp\Bundle\EasyAdminBundle\Config\Action;
use EasyCorp\Bundle\EasyAdminBundle\Config\Filters;
use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;
use EasyCorp\Bundle\EasyAdminBundle\Field\Field;
use EasyCorp\Bundle\EasyAdminBundle\Field\DateTimeField;
use EasyCorp\Bundle\EasyAdminBundle\Filter\EntityFilter;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;

class CommentCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Comment::class;
    }

    public function configureActions(Actions $actions): Actions
    {
        return $actions
        ->add(Crud::PAGE_INDEX, Action::DETAIL);
    }


    public function configureCrud(Crud $crud): Crud
    {
        return $crud
            ->setEntityLabelInSingular('Comment')
            ->setEntityLabelInPlural('Comments')
            ->setSearchFields(['post.title', 'user.email', 'user.name'])
            ->setDefaultSort(['create_at' => 'DESC'])
        ;
    }

    public function configureFilters(Filters $filters): Filters
    {
        return $filters
            ->add(EntityFilter::new('post'))
            ->add(EntityFilter::new('user'))
        ;
    }

    public function configureFields(string $pageName): iterable
    {
        return [
        AssociationField::new('post'),
        AssociationField::new('user'),
        Field::new('content'),
        DateTimeField::new('create_at')
        ];
    }

}
