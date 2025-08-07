use parc
go

--01. Combien y a-t-il d’attractions de type « Manèges à sensations fortes »?
select count(*) as "Nb d'attractions" from attractions where type = 'Manèges à sensations fortes';

--02. Quel est le nombre total de visiteurs qui sont mineurs ?
select count(age) from visiteurs where age <18;

select * from visiteurs;
--03. Combien y a-t-il de visiteurs qui ont un âge de renseigné ?
select count(age) from visiteurs;

--04. Quels sont les informations du visiteur qui a acheté le billet avec l’id 17
select * from visiteurs v
	inner join billets b on v.id = b.id_visiteur
	where b.id=17;

--05. Quels sont les prénoms, noms et âges des visiteurs qui ont achetés un billet de type « Enfant »
select v.prenom, v.nom, v.age from visiteurs v
	inner join billets b on v.id = b.id_visiteur
	where b.type like 'Enfant';

--06. Quels sont les noms, prénoms, tailles et date d’achat des visiteurs qui ont achetés un billet il y a plus de 3 jours
SELECT v.nom, v.prenom, v.taille, b.date_achat FROM visiteurs v
	INNER JOIN billets b ON v.id = b.id_visiteur
	WHERE b.date_achat < GETDATE() - 3;

--07. Combien de congés a posé Camille Mercier ?
SELECT COUNT(*) AS nombre_de_conges FROM conges AS c
	INNER JOIN personnels AS p ON p.id = c.id_personnel
	WHERE nom = 'mercier' AND prenom = 'camille';

--08. Quel motif de congés ont posé les agents de sécurité ?
SELECT motif FROM conges AS c
	INNER JOIN personnels AS p ON p.id = c.id_personnel
	WHERE poste = 'agent de sécurité';

--09. Quels sont les noms et prénoms des employés qui seront en congés dans les semaines à venir
select p.nom, p.prenom from personnels p
	inner join conges c on p.id = c.id_personnel
	where c.date_debut between GETDATE() and GETDATE()+7;

select p.nom, p.prenom, c.date_debut, DATEDIFF(DAY, c.date_debut, c.date_fin) from personnels p
	inner join conges c on p.id = c.id_personnel
	where c.date_debut > GETDATE();

--10. Quels sont les noms, prénoms, date d’entrée et date d’achat des visiteurs qui ont acheté leur billet le jour de leur entrée ?
select v.nom, v.prenom, v.date_entree, b.date_achat from visiteurs v
	inner join billets b on v.id = b.id_visiteur
	where v.date_entree = b.date_achat;

--Bonus :
--11. Quelle est la moyenne d’attente pour les attractions de type « Manèges à sensations fortes » ?
select avg(duree_moyenne_attente) from attractions
	where type like 'Manèges à sensations fortes';

--12. Quel est le nom et capacité de l’attraction avec la capacité la plus élevée ?
select nom, capacite from attractions
where capacite=(select max (capacite) from attractions);

select count(*) from attractions
	where capacite=(select max (capacite) from attractions);

select top (select count(*)
				from attractions
				where capacite=(select max (capacite) 
						from attractions)) nom, capacite 
	from attractions
	group by nom, capacite order by capacite desc;

