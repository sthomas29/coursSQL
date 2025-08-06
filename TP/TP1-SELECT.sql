-- TP 01 Module 03
use parc;
go

--1. Quelles sont les attractions du parc ?
select * from attractions;

--2. Quelles sont les noms et capacités des attractions qui ne sont pas des manèges pour enfants ?
select nom, capacite from attractions where type not like '%enfant%';
select nom, capacite from attractions where type not in('Manèges pour enfants');
select nom, capacite from attractions where type <> 'Manèges pour enfants'; -- !=


--3. Quelles sont les ids, noms et capacités des attractions dont la capacité est 
--supérieure à 20 personnes et la durée moyenne d'attente est inférieure à 25 minutes ?
select id, nom, capacite, duree_moyenne_attente from attractions
			where capacite >20 AND duree_moyenne_attente <25;


--4. Quelles sont les attractions dont le nom contient le mot "manège" ?
select nom from attractions where nom like '%manège%';
/*
--5. Quelles sont les noms et durée moyenne d’attente des attractions dont la taille
minimale requise est inférieure à 140 cm ou la capacité est supérieure ou égale
à 30 personnes ? */
select nom, duree_moyenne_attente from attractions
		where taille_minimale_requise < 140
			OR capacite >= 30;

select * from attractions;
/*
--6. Quelles sont les noms, ids et taille minimale requise pour les attractions de type
"spectacles" ou "divertissement" triés par nom ? */
select nom, id, taille_minimale_requise, type from attractions
		where type in ('Spectacles', 'Divertissement')
		order by nom;
select nom, id, taille_minimale_requise, type  from attractions
		where type='Spectacles' or type='Divertissement'
		order by nom;

--7. Quels sont les visiteurs âgés de moins de 18 ans ?
select * from visiteurs where age < 18;

/*
--8. Quels sont les noms et prénoms des visiteurs dont le nom commence par la lettre "L" triés par nom descendants ?
*/
select nom, prenom from visiteurs where nom like 'l%' order by nom desc;

/*
--9. Quels sont les ids, noms, prénoms et date d’entrée des visiteurs dont la taille
est supérieure ou égale à 170 cm et l'âge est inférieur à 25 ans ? */
select id, nom, prenom, date_entree from visiteurs where taille>= 170 and age <25;

--10. Quels sont les visiteurs dont le prénom est "Marie" ou "Thomas" ?
select * from visiteurs where prenom in ('marie', 'thomas');
select * from visiteurs where prenom = 'marie' or prenom ='thomas';

--11. Quels sont les ids, nom, prénom et tailles des visiteurs qui ont entre 10 et 20 ans inclus ?
select id, nom, prenom, taille, age from visiteurs where age between 10 and 20;
select id, nom, prenom, taille, age from visiteurs where age >= 10 and age <=20;

--12. Quels sont les visiteurs dont le nom de famille commence par "Le" et dont l'âge est supérieur à 20 ans ?
select * from visiteurs where nom like 'le%' and age > 20;

select * from billets;
--13. Quels sont les types de billets achetés par le visiteur ayant l'id 8 ?
select id_visiteur, type from billets where id_visiteur=8;

/* --14. Quels sont les identifiants des visiteurs qui ont acheté des billets
mais dont le type n'est ni "normal" ni "enfant" ? */
select id_visiteur,type from billets where type not in ('normal', 'enfant');
select id_visiteur, type from billets where type != 'normal' and type !='enfant';

--15. Quels sont les billets achetés il y a 6 jours ou plus triés du plus ancien au plus récent ?
select * from billets where date_achat <= GETDATE()-6 order by date_achat;
