/*
Démo manipulation des données
*/
use parc
go


INSERT INTO attractions (nom, type, taille_minimale_requise, capacite, duree_moyenne_attente)
VALUES
('Montagnes Italiennes', 'Manèges à sensations très fortes', 150, 10, 5);

-- Into et liste des colonnes ==> facultatif
-- Mais dans les bonnes pratiques, on précise toujours la liste, l'ordre des valeurs 
-- insérées devant respecter l'ordre des colonnes indiquées
-- Si la liste est omise, c'est l'ordre des colonnes dans la table qui est appliqué.

-- Insertion d'une personne en précisant un ordre différent des colonnes
insert personnels (prenom, salaire, nom)
VALUES ('Julie', 2000, 'Martin');
select * from personnels where prenom='Julie';

-- insertion d'une personne en ne précisant pas les colonnes mais en respectant l'ordre
-- des colonnes définies dans la table
insert personnels VALUES ('Dupont', 'Alice', 'Comédienne', 2000);
select * from personnels where prenom='Alice';

-- L'ordre n'est pas respecté et les valeurs renseignées sont donc insérées n'importe comment.
insert personnels VALUES ( '2000', 'Alice','Pas de métier', 0);
select * from personnels where nom='2000';

-- suppression de l'enregistrement erroné ci-dessus
delete from personnels where poste='Pas de métier';
select * from personnels where nom='2000';
