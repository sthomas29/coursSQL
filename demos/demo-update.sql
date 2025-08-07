use parc
go

-- Pour d�sactiver l'auto commit par d�faut de SQL Server
SET IMPLICIT_TRANSACTIONS ON;

-- Sans restriction, j'affecte le pr�nom 'Alice' � tous les enregistrements de la table 'Personnels'
-- update personnels set prenom='Alice';
--select * from personnels;

-- Fondamental, toujours penser � la restriction avec where
update personnels set prenom='Alice' where id=1;
update personnels set salaire=2000 where salaire<2000;
--select * from personnels;


/***********************************
Suppression de donn�es SANS passer via une transaction
************************************/

-- Exemple avec DELETE sans aucune restriction
-- Suppression de tous les cong�s afin de lever la contrainte de FK sur id_personnel
--delete from conges;
--delete from personnels;
--select * from personnels;

--select * from conges;

-- impossible, les noms et pr�noms sont dans la table 'Personnel'
--delete from conges where nom='Mercier' and prenom='Camille';

-- Suppression des cong�s de Camille � partir de l'id connu
delete from conges where id_personnel=18;

-- Suppression des cong�s de Camille � partir de son nom et de son pr�nom
delete from conges where id_personnel=(select id from personnels where nom='Mercier' and prenom='Camille');
--select * from personnels where poste like'%responsable%';

/***********************************
Suppression de donn�es EN PASSANT via une transaction
************************************/
-- D�but d'une transaction
begin tran
	print 'D�but Transaction';
	--Obligation de supprimer les entr�es de cong�s de Camille Mercier
	--avant d'ex�&cuter la suppression des Responsables dans la table 'Personnels'
	delete from conges where id_personnel=(select id from personnels where nom='Mercier' and prenom='Camille');

	delete from personnels where poste like'%responsable%';
	
	select p.nom, p.prenom from personnels p
		inner join conges c on p.id = c.id_personnel 
	where poste like'%responsable%';

-- �tes-vous s�r de supprimer les responsables du PARC ?
	-- ==> commit tran
--Sinon
	-- ==> rollback tran

commit tran

select * from personnels where poste like'%responsable%';




