<?php

namespace App\Repository;

use App\Entity\Livre;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<Livre>
 *
 * @method Livre|null find($id, $lockMode = null, $lockVersion = null)
 * @method Livre|null findOneBy(array $criteria, array $orderBy = null)
 * @method Livre[]    findAll()
 * @method Livre[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class LivreRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Livre::class);
    }

    /**
        * @return Livre[]
        */
    public function findByTitle($terme): array
    {
        return $this->createQueryBuilder('l')
            ->where('LOWER(l.titre) LIKE LOWER(:val)')
            ->setParameter('val', '%' . $terme . '%')
            // ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }

    public function findByTitleAndCategorie($terme, $categorieId): array
    {
        return $this->createQueryBuilder('l')
            ->innerJoin('l.categorie', 'c')
            ->where('LOWER(l.titre) LIKE LOWER(:terme)')
            ->andWhere('c.id = :categorieId')
            ->setParameter('terme', '%' . $terme . '%')
            ->setParameter('categorieId', $categorieId)
            ->getQuery()
            ->getResult();
    }


//    public function findOneBySomeField($value): ?Livre
//    {
//        return $this->createQueryBuilder('l')
//            ->andWhere('l.exampleField = :val')
//            ->setParameter('val', $value)
//            ->getQuery()
//            ->getOneOrNullResult()
//        ;
//    }
}
