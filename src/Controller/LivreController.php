<?php

namespace App\Controller;

use App\Entity\Livre;
use App\Form\LivreType;
use App\Repository\LivreRepository;
use App\Repository\CategorieRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/livre')]
class LivreController extends AbstractController
{
    #[Route('/', name: 'app_livre_index', methods: ['GET', 'POST'])]
    public function index(LivreRepository $livreRepository, CategorieRepository $categorieRepository, Request $request): Response
    {
        $terme = $request->query->get('search', '');
        $categorieId = $request->query->get('categorie');

        if ($terme && $categorieId) {
            $livres = $livreRepository->findByTitleAndCategorie($terme, $categorieId);
        } elseif ($terme) {
            $livres = $livreRepository->findByTitle($terme);
        } elseif ($categorieId) {
            $livres = $livreRepository->findBy(['categorie' => $categorieId]);
        } else {
            $livres = $livreRepository->findAll();
        }

        $categories = $categorieRepository->findAll();

        return $this->render('livre/index.html.twig', [
            'livres' => $livres,
            'termeRecherche' => $terme,
            'categories' => $categories,
            'categorieSelected' => $categorieId
        ]);
    }

    #[Route('/new', name: 'app_livre_new', methods: ['GET', 'POST'])]
    public function new(Request $request, EntityManagerInterface $entityManager): Response
    {
        $livre = new Livre();
        $now = new \DateTime('now', new \DateTimeZone('Europe/Paris'));
        $livre->setDateAjout($now);

        $form = $this->createForm(LivreType::class, $livre);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $imageFile = $form->get('imageFile')->getData();
            if ($imageFile) {
                // Gérer l'upload de l'image
                $newFilename = uniqid().'.'.$imageFile->getClientOriginalExtension();
                $imageFile->move($this->getParameter('images_directory'), $newFilename);
                $livre->setImagePath($newFilename);
            }
            
            $entityManager->persist($livre);
            $entityManager->flush();

            return $this->redirectToRoute('app_livre_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('livre/new.html.twig', [
            'livre' => $livre,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_livre_show', methods: ['GET'])]
    public function show(Livre $livre): Response
    {
        return $this->render('livre/show.html.twig', [
            'livre' => $livre,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_livre_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Livre $livre, EntityManagerInterface $entityManager): Response
    {
        $form = $this->createForm(LivreType::class, $livre);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $now = new \DateTime('now', new \DateTimeZone('Europe/Paris'));
            $livre->setDateModification($now);
            $entityManager->flush();

            return $this->redirectToRoute('app_livre_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('livre/edit.html.twig', [
            'livre' => $livre,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_livre_delete', methods: ['POST'])]
    public function delete(Request $request, Livre $livre, EntityManagerInterface $entityManager): Response
    {
        if ($this->isCsrfTokenValid('delete'.$livre->getId(), $request->request->get('_token'))) {
            $entityManager->remove($livre);
            $entityManager->flush();
        }

        return $this->redirectToRoute('app_livre_index', [], Response::HTTP_SEE_OTHER);
    }
}
