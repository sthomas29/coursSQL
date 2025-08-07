use parc
go


--1.Insérez un nouveau visiteur dans la table "visiteurs" avec les détails suivants :
	--nom "Lacoste",
	--prénom "Emma",
	--âge 28,
	--taille 175
	--et la date d'entrée au parc à la date actuelle.
INSERT INTO visiteurs (nom, prenom, age, taille, date_entree) VALUES ('Lacoste', 'Emma', 28, 175, GETDATE());
--select * from visiteurs;

--2.Mettez à jour l'âge du visiteur ayant l'ID 3 et changez-le pour 11
UPDATE visiteurs SET age = 11 WHERE id = 3;
--select * from visiteurs;

--3.Supprimez l'attraction ayant l'ID 14 de la table "attractions".
DELETE FROM attractions WHERE id = 14;
--select * from attractions;

--4.Insérez un nouvel employé avec le nom "Durand", le prénom "Sophie", le poste "Technicien d'entretien" et un salaire de 2100.75.
INSERT INTO personnels (nom, prenom, poste, salaire) VALUES ('Durand', 'Sophie', 'Technicien d''entretien', 2100.75);
--select * from personnels;

--5. Mettez à jour la taille du visiteur GIRARD Maxime avec la valeur 177
UPDATE visiteurs SET taille = 177 WHERE prenom = 'Maxime' AND nom = 'Girard';

--6. Insérez un nouveau billet pour le visiteur LAURENT Pierre,avec le type "Senior" et la date d'achat en tant que date actuelle.
INSERT INTO billets (id_visiteur, type, date_achat) VALUES (5, 'Senior', GETDATE());

--7. Mettez à jour la taille minimale requise à 150 des attractions
-- avec une durée moyenne d'attente strictement supérieure à 25 et dont la capacité est inférieure ou égale à 100.
UPDATE attractions SET taille_minimale_requise = 150 WHERE duree_moyenne_attente > 25 AND capacite <= 100;
--select * from attractions;

--8. Supprimez toutes les attractions dont la capacité est inférieure ou égale à 20 en utilisant une transaction.
-- Annulez cette suppression.
BEGIN TRAN transaction1
	DELETE FROM attractions WHERE capacite <= 20;
	select * from attractions where capacite <=20;
ROLLBACK TRAN transaction1
select * from attractions where capacite <=20;

/*
9.Insérez un nouveau billet pour le visiteur ROUSSEAU Alexandre, avec le type "Enfant" et la date d'achat à DDJ - 4. 
Modifiez ensuite le type par « VIP ». Utilisez une transaction pour faire ces changements
*/
BEGIN TRAN
	INSERT INTO billets (id_visiteur, type, date_achat) VALUES (11, 'Enfant', GETDATE() - 4);

	--SELECT * FROM billets; -- Pour connaitre l'id de l'enregistrement

	UPDATE billets SET type = 'ExtraNormal' WHERE id = (select max(id) from billets); -- select count(*) from billets;
COMMIT TRAN
SELECT * FROM billets;

--10.Modifiez le salaire de tout le personnel en l'augmentant de 10%
UPDATE personnels SET salaire = salaire * 1.1;

--11.Mettez à jour l'âge des visiteurs pour lesquels il n'est pas renseigné, avec la valeur de 18.
UPDATE visiteurs SET age = 18 WHERE age IS NULL;
--select * from visiteurs;

--12.Supprimez le visiteur ayant l'ID 8
BEGIN TRAN
	--DELETE FROM visiteurs WHERE id  = 8;
	-- Ne fonctionne pas à cause de la clé étrangère, les billets associés à ce visiteur ne peuvent pas exister sans lui.
	DELETE FROM billets WHERE id_visiteur = 8;
	DELETE FROM visiteurs WHERE id = 8;
COMMIT TRAN

/*
13.Insérez deux nouvelles attractions en utilisant une seule requête INSERT. 
Les nouvelles attractions sont "Le Grand Huit", de type "Manèges à sensations fortes", avec une taille minimale requise de 160, une capacité de 30, et une durée moyenne d'attente de 40 minutes ;
et "La Rivière Enchantée", de type "Manèges aquatiques", avec une taille minimale requise de 120, une capacité de 25, et une durée moyenne d'attente de 20 minutes.
*/
INSERT INTO attractions (nom, type, taille_minimale_requise, capacite, duree_moyenne_attente)
	VALUES 
		('Le Grand Huit', 'Manèges à sensations fortes', 160, 30, 40), 
		('La Rivière Enchantée', 'Manèges aquatiques', 120, 25, 20);

select * from attractions;

-- Suppression de toutes les attractions SANS réinitialiser l'incrément de la PK
--DELETE from attractions;

-- Suppression de toutes les attractions ET réinitialisation de l'incrément de la PK
--TRUNCATE TABLE attractions;
