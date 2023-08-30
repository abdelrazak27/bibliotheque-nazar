<?php

namespace App\Entity;

use App\Repository\TestEntityRepository;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: TestEntityRepository::class)]
class TestEntity
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(type: Types::DATE_MUTABLE, nullable: true)]
    private ?\DateTimeInterface $testField = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getTestField(): ?\DateTimeInterface
    {
        return $this->testField;
    }

    public function setTestField(?\DateTimeInterface $testField): static
    {
        $this->testField = $testField;

        return $this;
    }
}
