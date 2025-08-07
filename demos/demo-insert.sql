/*
D�mo manipulation des donn�es
*/
use parc
go


INSERT INTO attractions (nom, type, taille_minimale_requise, capacite, duree_moyenne_attente)
VALUES
('Montagnes Italiennes', 'Man�ges � sensations tr�s fortes', 150, 10, 5);

-- Into et liste des colonnes ==> facultatif
-- Mais dans les bonnes pratiques, on pr�cise toujours la liste, l'ordre des valeurs 
-- ins�r�es devant respecter l'ordre des colonnes indiqu�es
-- Si la liste est omise, c'est l'ordre des colonnes dans la table qui est appliqu�.

-- Insertion d'une personne en pr�cisant un ordre diff�rent des colonnes
insert personnels (prenom, salaire, nom)
VALUES ('Julie', 2000, 'Martin');
select * from personnels where prenom='Julie';

-- insertion d'une personne en ne pr�cisant pas les colonnes mais en respectant l'ordre
-- des colonnes d�finies dans la table
insert personnels VALUES ('Dupont', 'Alice', 'Com�dienne', 2000);
select * from personnels where prenom='Alice';

-- L'ordre n'est pas respect� et les valeurs renseign�es sont donc ins�r�es n'importe comment.
insert personnels VALUES ( '2000', 'Alice','Pas de m�tier', 0);
select * from personnels where nom='2000';

-- suppression de l'enregistrement erron� ci-dessus
delete from personnels where poste='Pas de m�tier';
select * from personnels where nom='2000';
