USE PARC
GO
print 'Script PARC'

alter table adresses
	drop constraint fk_adresse_personnel;

--Suppression des tables si elles existent afin de les recr�er
DROP TABLE IF EXISTS attractions;
DROP TABLE IF EXISTS billets;
DROP TABLE IF EXISTS visiteurs;
DROP TABLE IF EXISTS conges;
DROP TABLE IF EXISTS personnels;

-- Cr�ation de la table "Attractions"
CREATE TABLE attractions (
  id INT PRIMARY KEY IDENTITY,
  nom VARCHAR(50),
  type VARCHAR(50),
  taille_minimale_requise INT,
  capacite INT,
  duree_moyenne_attente INT
);

-- Cr�ation de la table "Visiteurs"
CREATE TABLE visiteurs (
  id INT PRIMARY KEY IDENTITY,
  nom VARCHAR(50),
  prenom VARCHAR(50),
  age INT,
  taille INT,
  date_entree DATE
);

-- Cr�ation de la table "Billets"
CREATE TABLE billets (
  id INT PRIMARY KEY IDENTITY,
  id_visiteur INT,
  type VARCHAR(50),
  date_achat DATE,
  FOREIGN KEY (id_visiteur) REFERENCES visiteurs(id)
);

-- Cr�ation de la table "Personnels"
CREATE TABLE personnels (
  id INT PRIMARY KEY IDENTITY,
  nom VARCHAR(50),
  prenom VARCHAR(50),
  poste VARCHAR(50),
  salaire DECIMAL(6,2)
);

-- Cr�ation de la table "Cong�s"
CREATE TABLE conges (
  id INT PRIMARY KEY IDENTITY,
  id_personnel INT,
  date_debut DATE,
  date_fin DATE,
  motif VARCHAR(100),
  FOREIGN KEY (id_personnel) REFERENCES personnels(id)
);

--Insertion
--Table "Attractions"

-- Permet de d�sactiver l'auto-incr�ment de la PK pr�vu avec le mot-cl� IDENTITY.
SET IDENTITY_INSERT attractions ON

INSERT INTO attractions (id, nom, type, taille_minimale_requise, capacite, duree_moyenne_attente)
VALUES
(1, 'Montagnes Russes', 'Man�ges � sensations fortes', 140, 20, 30),
(2, 'Carrousel', 'Man�ges pour enfants', 80, 30, 10),
(3, 'Tour de chute libre', 'Man�ges � sensations fortes', 160, 10, 45),
(4, 'Train fant�me', 'Attractions effrayantes', 120, 15, 20),
(5, 'Roue panoramique', 'Observation', 100, 40, 15),
(6, 'Bateau pirate', 'Man�ges � sensations fortes', 110, 25, 25),
(7, 'Mini-golf', 'Jeux', 0, 50, 5),
(8, 'Chaises volantes', 'Man�ges � sensations fortes', 130, 12, 35),
(9, 'Parcours d''aventure', 'Activit�s en plein air', 140, 20, 30),
(10, 'Spectacle de dauphins', 'Spectacles', 0, 100, 15),
(11, 'Cin�ma 4D', 'Divertissement', 0, 40, 10),
(12, 'Piscine � vagues', 'Piscines', 0, 200, 5),
(13, 'Montagnes russes aquatiques', 'Man�ges aquatiques', 120, 15, 25),
(14, 'Man�ge des tasses', 'Man�ges pour enfants', 80, 20, 10),
(15, 'Th��tre en plein air', 'Spectacles', 0, 150, 20),
(16, 'Toboggan g�ant', 'Man�ges aquatiques', 140, 10, 30),
(17, 'Parcours de cordes', 'Activit�s en plein air', 160, 20, 45),
(18, 'Maison hant�e', 'Attractions effrayantes', 110, 15, 20),
(19, 'Montagnes russes invers�es', 'Man�ges � sensations fortes', 150, 12, 35),
(20, 'Trampoline g�ant', 'Activit�s en plein air', 0, 30, 5);

-- Je r�active l'auto-incr�ment sur la PK
SET IDENTITY_INSERT attractions OFF



-- Table "Visiteurs"
SET IDENTITY_INSERT visiteurs ON
INSERT INTO visiteurs (id, nom, prenom, age, taille, date_entree)
VALUES
  (1, 'Dupont', 'Jean', 35, 180, GETDATE() - 1),
  (2, 'Martin', 'Marie', 28, 160, GETDATE() - 2),
  (3, 'Lefebvre', 'Thomas', 10, 130, GETDATE() - 3),
  (4, 'Dubois', 'Sophie', 45, 170, GETDATE() - 4),
  (5, 'Laurent', 'Pierre', 50, 175, GETDATE() - 5),
  (6, 'Leroy', 'Camille', 20, 150, GETDATE() - 6),
  (7, 'Garcia', 'Lucie', 12, 140, GETDATE() - 7),
  (8, 'Martinez', 'Nicolas', 30, 180, GETDATE()),
  (9, 'Petit', 'Laura', 22, 165, GETDATE()),
  (10, 'Rousseau', 'Alexandre', 40, 185, GETDATE()),
  (11, 'Gauthier', 'Emma', 8, 120, GETDATE() ),
  (12, 'Mercier', 'Hugo', 15, 155, GETDATE() - 5),
  (13, 'Caron', 'Chlo�', 27, 170, GETDATE() - 6),
  (14, 'Roy', 'Louis', 18, 175, GETDATE() - 7),
  (15, 'Berger', 'Manon', null, 160, GETDATE() - 1),
  (16, 'Lemoine', 'Antoine', 24, 175, GETDATE() - 2),
  (17, 'Marchand', 'Julie', 9, 130, GETDATE() - 3),
  (18, 'Girard', 'Maxime', null, null, GETDATE() - 4),
  (19, 'Lefevre', 'Sarah', 26, 165, GETDATE()),
  (20, 'Renault', 'Mathis', 13, 140, GETDATE());
SET IDENTITY_INSERT visiteurs OFF

-- Table "Billets"
SET IDENTITY_INSERT billets ON
INSERT INTO billets (id, id_visiteur, type, date_achat)
VALUES
  (1, 8, 'Normal', GETDATE()),
  (2, 7, 'Enfant', GETDATE() - 7),
  (3, 3, 'Enfant', GETDATE() - 3),
  (4, 15, 'Normal', GETDATE() + 1),
  (5, 5, 'Senior', GETDATE() - 5),
  (6, 10, 'Normal', GETDATE()),
  (7, 2, 'Normal', GETDATE() - 2),
  (8, 4, 'Normal', GETDATE() - 4),
  (9, 9, 'Normal', GETDATE()),
  (10, 1, 'Normal', GETDATE() - 1),
  (11, 11, 'Enfant', GETDATE()),
  (12, 6, 'Normal', GETDATE() - 6),
  (13, 17, 'Enfant', GETDATE() + 3),
  (14, 20, 'Enfant', GETDATE() - 7),
  (15, 14, 'Normal', GETDATE() - 7),
  (16, 16, 'Normal', GETDATE() + 2),
  (17, 19, 'Normal', GETDATE() - 7),
  (18, 12, 'Normal', GETDATE() - 5),
  (19, 18, 'Normal', GETDATE() + 4),
  (20, 13, 'Normal', GETDATE() - 6);
SET IDENTITY_INSERT billets OFF

-- Table "Personnels"
SET IDENTITY_INSERT personnels ON
INSERT INTO personnels (id, nom, prenom, poste, salaire)
VALUES
  (1, 'Tremblay', '�ric', 'Responsable des attractions', 2500),
  (2, 'Lefevre', 'Sophie', 'Op�rateur d''attraction', 1800.75),
  (3, 'Martin', 'Maxime', 'Agent de s�curit�', 2000.25),
  (4, 'Dubois', 'Julie', 'Vendeur de billets', 1700),
  (5, 'Leroy', 'Philippe', 'Technicien d''entretien', 2200.60),
  (6, 'Lambert', 'Marie', 'Animateur', 1900.35),
  (7, 'Mercier', 'Antoine', 'Agent d''accueil', 1600.90),
  (8, 'Garcia', '�milie', 'Responsable de la restauration', 2300.70),
  (9, 'Roy', 'Nicolas', 'Agent de nettoyage', 1500.45),
  (10, 'Berger', 'Laura', 'Guide touristique', 2100),
  (11, 'Lemoine', 'Alexandre', 'Responsable des spectacles', 2400.25),
  (12, 'Marchand', 'Manon', 'Op�rateur d''attraction', 1800.85),
  (13, 'Girard', 'Hugo', 'Agent de s�curit�', 2000.30),
  (14, 'Lefebvre', 'Chlo�', 'Vendeur de billets', 1700.95),
  (15, 'Martin', 'Louis', null, 2200),
  (16, 'Dubois', 'Emma', 'Animateur', 1900),
  (17, 'Leroy', 'Thomas', 'Agent d''accueil', 1600.75),
  (18, 'Mercier', 'Camille', 'Responsable de la restauration', 2300),
  (19, 'Garcia', 'Pierre', 'Agent de nettoyage', 1500),
  (20, 'Roy', 'Sophie', 'Guide touristique', 2100);
SET IDENTITY_INSERT personnels OFF

-- Table "Cong�s"
SET IDENTITY_INSERT conges ON
 INSERT INTO conges (id, id_personnel, date_debut, date_fin, motif)
VALUES
  (1, 2, GETDATE() - 30, GETDATE() - 20, 'Cong�s pay�s'),
  (2, 4, GETDATE() + 30, GETDATE() + 40, 'Cong�s maladie'),
  (3, 5, GETDATE() - 80, GETDATE() - 75, 'Cong�s pay�s'),
  (4, 9, GETDATE() - 10, GETDATE() + 21, 'Cong�s pay�s'),
  (5, 18, GETDATE() - 35, GETDATE() - 20, 'Cong�s maladie'),
  (6, 18, GETDATE() - 5, GETDATE() - 4, 'R�cup�ration'),
  (7, 3, GETDATE() - 30, GETDATE() - 25, 'Cong�s sans solde'),
  (8, 7, GETDATE() - 20, GETDATE() - 17, 'Cong�s sans solde'),
  (9, 7, GETDATE() + 5, GETDATE() + 6, 'R�cup�ration'),
  (10, 18, GETDATE() + 60, GETDATE() + 80, 'Cong�s pay�s')
SET IDENTITY_INSERT conges OFF

--R�cup�ration des informations
SELECT * FROM attractions
SELECT * FROM visiteurs
SELECT * FROM billets
SELECT * FROM personnels
SELECT * FROM conges