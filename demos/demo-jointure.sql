use parc;
go

-- Je veux afficher les dates d'achat, noms et prénoms des visiteurs ayant pris un billet.

select * from billets;
select * from visiteurs;

select * from billets
		inner join visiteurs on billets.id_visiteur = visiteurs.id;

select b.date_achat as "Date d'achat", v.nom as 'Nom', v.prenom as 'Prénom' from billets as b
		inner join visiteurs as v on b.id_visiteur = v.id;


-- Je veux afficher les noms et prénoms et les motifs de congés pris par le personnel.
select p.nom, p.prenom, c.date_debut, c.date_fin, c.motif  from conges c
	inner join personnels p on c.id_personnel = p.id;

-- Je veux afficher les noms et prénoms et les motifs de congés pris par Camille Mercier.
select c.id_personnel, p.nom, p.prenom, c.date_debut, c.date_fin, c.motif  from conges c
	inner join personnels p on c.id_personnel = p.id
	where p.nom='Mercier'; --AND p.prenom='Camille';

select * from conges;

-- Je veux afficher le nb de congés pris par chaque personnel.
select p.nom, p.prenom, count(c.id_personnel) as 'Nb Congés pris' from personnels p
	inner join conges c on p.id = c.id_personnel
	group by p.nom, p.prenom; -- c.id_personnel;

-- Je veux afficher le nb de jours de congés pris par chaque personnel
 --difference entre date début et date fin

 select p.nom, p.prenom, sum(DATEDIFF(DAY, c.date_debut, c.date_fin)+1) AS 'Nb Jours pris'
	from personnels p
	inner join conges c on p.id = c.id_personnel
	group by p.nom, p.prenom;

select * from conges c
	inner join personnels p on c.id_personnel = p.id
	where p.nom='mercier' and p.prenom='camille';

-- Exemple de requête LEFT JOIN
-- Je veux récupérer la liste des congés pris par le personnel mais
--je veux aussi récupérer ceux qui n'ont pas encore pris de congés.

select p.nom, p.prenom, count(c.id_personnel) as 'Nb Congés pris' from personnels p
	left join conges c on p.id = c.id_personnel
	group by p.nom, p.prenom; 

-- Je veux afficher le nb de congés pris par chaque personnel.
select p.nom, p.prenom, count(c.id_personnel) as 'Nb Congés pris' from personnels p
	inner join conges c on p.id = c.id_personnel
	group by p.nom, p.prenom;

-- Exemple de requête RIGHT JOIN
select p.nom, p.prenom, count(c.id_personnel) as 'Nb Congés pris' from conges c
	right join personnels p on p.id = c.id_personnel
	group by p.nom, p.prenom; 












SELECT b.date_achat , v.nom, v.prenom FROM billets as b
		INNER JOIN visiteurs as v ON b.id_visiteur = v.id;
