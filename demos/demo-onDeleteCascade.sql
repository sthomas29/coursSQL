use parc;
go

-- Exécution du contenu du script parc.sql via sqlcmd.
-- Pour activer le mode sqlcmd, cliquez sur SQLCMD mode dans le menu 'Query'
:r "C:\Users\steph\coursSQL\demos\parc.sql"

drop table if exists adresses;

-- Création de la table "Congés"
CREATE TABLE adresses (
  id INT PRIMARY KEY IDENTITY,
  id_personnel INT,
  num_adresse INT,
  adresse1 VARCHAR(50),
  adresse2 VARCHAR(50),
  code_postal char(5),
  ville VARCHAR(50)
  --FOREIGN KEY (id_personnel) REFERENCES personnels(id) ON DELETE CASCADE
);
--alter table adresses
	--drop constraint fk_adresse_personnel;

ALTER TABLE adresses
	ADD CONSTRAINT fk_adresse_personnel
		FOREIGN KEY(id_personnel) REFERENCES personnels(id)
		ON DELETE CASCADE

INSERT INTO adresses (id_personnel, num_adresse, adresse1, adresse2, code_postal, ville)
VALUES
	(1,10,'Avenue de la Canebiere', '','13000', 'Marseille'),
	(6,10,'Place du Capitole', '','31000', 'Toulouse'),
	(8,10,'Avenue de Fourvière', '','69000', 'Lyon'),
	(10,10,'Place du Commerce', '','44000', 'Nantes'),
	(11,10,'Grand''Place', '','59000', 'Lille');

select * from adresses;

--Je veux supprimer le personnel avec l'id 5 
delete from personnels where id=6;

select * from personnels p
	left join conges c on p.id = c.id_personnel
	where c.motif is null;

select * from adresses;