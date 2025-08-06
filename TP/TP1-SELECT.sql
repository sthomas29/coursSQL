-- TP 01 Module 03
use parc;
go

--1. Quelles sont les attractions du parc ?
select * from attractions;

--2. Quelles sont les noms et capacit�s des attractions qui ne sont pas des man�ges pour enfants ?
select nom, capacite from attractions where type not like '%enfant%';
select nom, capacite from attractions where type not in('Man�ges pour enfants');
select nom, capacite from attractions where type <> 'Man�ges pour enfants'; -- !=


--3. Quelles sont les ids, noms et capacit�s des attractions dont la capacit� est 
--sup�rieure � 20 personnes et la dur�e moyenne d'attente est inf�rieure � 25 minutes ?
select id, nom, capacite, duree_moyenne_attente from attractions
			where capacite >20 AND duree_moyenne_attente <25;


--4. Quelles sont les attractions dont le nom contient le mot "man�ge" ?
select nom from attractions where nom like '%man�ge%';
/*
--5. Quelles sont les noms et dur�e moyenne d�attente des attractions dont la taille
minimale requise est inf�rieure � 140 cm ou la capacit� est sup�rieure ou �gale
� 30 personnes ? */
select nom, duree_moyenne_attente from attractions
		where taille_minimale_requise < 140
			OR capacite >= 30;

select * from attractions;
/*
--6. Quelles sont les noms, ids et taille minimale requise pour les attractions de type
"spectacles" ou "divertissement" tri�s par nom ? */
select nom, id, taille_minimale_requise, type from attractions
		where type in ('Spectacles', 'Divertissement')
		order by nom;
select nom, id, taille_minimale_requise, type  from attractions
		where type='Spectacles' or type='Divertissement'
		order by nom;

--7. Quels sont les visiteurs �g�s de moins de 18 ans ?
select * from visiteurs where age < 18;

/*
--8. Quels sont les noms et pr�noms des visiteurs dont le nom commence par la lettre "L" tri�s par nom descendants ?
*/
select nom, prenom from visiteurs where nom like 'l%' order by nom desc;

/*
--9. Quels sont les ids, noms, pr�noms et date d�entr�e des visiteurs dont la taille
est sup�rieure ou �gale � 170 cm et l'�ge est inf�rieur � 25 ans ? */
select id, nom, prenom, date_entree from visiteurs where taille>= 170 and age <25;

--10. Quels sont les visiteurs dont le pr�nom est "Marie" ou "Thomas" ?
select * from visiteurs where prenom in ('marie', 'thomas');
select * from visiteurs where prenom = 'marie' or prenom ='thomas';

--11. Quels sont les ids, nom, pr�nom et tailles des visiteurs qui ont entre 10 et 20 ans inclus ?
select id, nom, prenom, taille, age from visiteurs where age between 10 and 20;
select id, nom, prenom, taille, age from visiteurs where age >= 10 and age <=20;

--12. Quels sont les visiteurs dont le nom de famille commence par "Le" et dont l'�ge est sup�rieur � 20 ans ?
select * from visiteurs where nom like 'le%' and age > 20;

select * from billets;
--13. Quels sont les types de billets achet�s par le visiteur ayant l'id 8 ?
select id_visiteur, type from billets where id_visiteur=8;

/* --14. Quels sont les identifiants des visiteurs qui ont achet� des billets
mais dont le type n'est ni "normal" ni "enfant" ? */
select id_visiteur,type from billets where type not in ('normal', 'enfant');
select id_visiteur, type from billets where type != 'normal' and type !='enfant';

--15. Quels sont les billets achet�s il y a 6 jours ou plus tri�s du plus ancien au plus r�cent ?
select * from billets where date_achat <= GETDATE()-6 order by date_achat;
