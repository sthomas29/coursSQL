use parc;
go

select * from visiteurs;

select count(*) AS nb_visiteurs from visiteurs;

--select count(age) as nb_valeurs_age_renseign�es from visiteurs;
--select count(taille) 'Nb valeurs taille renseign�es' from visiteurs;

select	count(age) as nb_valeurs_age_renseign�es,
		count(taille) 'Nb valeurs taille renseign�es'
		from visiteurs;

select min(age) '�ge min', max(age) '�ge maxi', avg(age) '�ge moyen' from visiteurs;

/*
select min(taille) from visiteurs;
select max(taille) from visiteurs;
select avg(taille) from visiteurs;
*/
select	min(taille) 'taille mini',
		max(taille) 'taille maxi',
		avg(taille) 'taille moyenne'
		from visiteurs;

-- Les fonctions statistiques ne fonctionnent pas sur les type 'char' ou 'varchar'
-- select min(nom) , max(nom) , avg(nom) from visiteurs;








