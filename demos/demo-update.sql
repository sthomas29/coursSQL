
use parc
go

-- Sans restriction, j'affecte le prénom 'Alice' à tous les enregistrements de la table 'Personnels'
-- update personnels set prenom='Alice';
select * from personnels;

-- Fondamental, toujours penser à la restriction avec where
update personnels set prenom='Alice' where id=1;
update personnels set salaire=2000 where salaire<2000;
select * from personnels;

-- Exemple avec DELETE sans aucune restriction
-- Suppression de tous les congés afin de lever la contrainte de FK sur id_personnel
--delete from conges;
--delete from personnels;
select * from personnels;

select * from conges;

-- impossible, les noms et prénoms sont dans la table 'Personnel'
--delete from conges where nom='Mercier' and prenom='Camille';

-- Suppression des congés de Camille à partir de l'id connu
delete from conges where id_personnel=18;

-- Suppression des congés de Camille à partir de son nom et de son prénom
delete from conges where id_personnel=(select id from personnels where nom='Mercier' and prenom='Camille');

delete from personnels where poste like'%responsable%';
select * from personnels where poste like'%responsable%';


select p.nom, p.prenom from personnels p
	inner join conges c on p.id = c.id_personnel 
where poste like'%responsable%';



