# Gestion des Utilisateurs et des Privileges - Base de Données Oracle

## Description du Projet

Ce projet porte sur la gestion des utilisateurs et des privilèges dans une base de données Oracle. Il inclut la création de tables avec contraintes, la gestion des utilisateurs et des permissions, ainsi que l'exploitation du dictionnaire de données.

## Contenu du Projet

### 1. Création des Tables

Les tables suivantes sont créées avec des contraintes d'intégrité :

- **Usine** : Contient les informations des usines.
- **Produit** : Stocke les produits et leurs caractéristiques (couleur, poids, etc.).
- **Fournisseur** : Liste des fournisseurs et leurs informations de contact.
- **Livraison** : Décrit les livraisons entre fournisseurs et usines avec des clés étrangères.

## Schéma de la Base de Données

La base de données est composée des tables suivantes : **Usine, Produit, Fournisseur, et Livraison**.

## Schéma de la Base de Données

La base de données est composée des tables suivantes : **Usine, Produit, Fournisseur, et Livraison**.

```sql
-- Table Usine
CREATE TABLE Usine (
    NU INT PRIMARY KEY,
    NomU VARCHAR(50),
    Ville VARCHAR(50)
);

-- Table Produit
CREATE TABLE Produit (
    NP INT PRIMARY KEY,
    NomP VARCHAR(50),
    Couleur VARCHAR(20),
    Poids DECIMAL(10,3) CHECK (Poids > 0)
);

-- Table Fournisseur
CREATE TABLE Fournisseur (
    NF INT PRIMARY KEY,
    NomF VARCHAR(50),
    Statut VARCHAR(20),
    Ville VARCHAR(50),
    Email VARCHAR(100) UNIQUE
);

-- Table Livraison
CREATE TABLE Livraison (
    NP INT,
    NU INT,
    NF INT,
    Quantite INT CHECK (Quantite > 0),
    PRIMARY KEY (NP, NU, NF),
    FOREIGN KEY (NP) REFERENCES Produit(NP),
    FOREIGN KEY (NU) REFERENCES Usine(NU),
    FOREIGN KEY (NF) REFERENCES Fournisseur(NF)
);


### 2. Gestion des Utilisateurs et des Permissions

- Création d'un utilisateur `USERFOUR` ayant les mêmes tablespaces qu'un autre utilisateur.
- Attribution des privilèges de connexion et de lecture sur certaines tables.
- Création d’un rôle `GESTIONNAIRE_DES_LIVRAISONS` pour gérer les livraisons et les produits.
- Vérification des privilèges et rôles attribués aux utilisateurs.



---

### 3. Exploitation du Dictionnaire Oracle

Le dictionnaire Oracle permet d’obtenir des informations sur :

- Les tables existantes.
- Les contraintes appliquées.
- Les rôles et privilèges attribués aux utilisateurs.

Requêtes utiles :

```sql
SELECT * FROM USER_CONSTRAINTS;
SELECT * FROM DBA_USERS;
SELECT * FROM USER_TAB_COLUMNS;
