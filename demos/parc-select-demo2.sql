use parc;
go

select * from visiteurs;

select count(*) AS nb_visiteurs from visiteurs;

--select count(age) as nb_valeurs_age_renseignées from visiteurs;
--select count(taille) 'Nb valeurs taille renseignées' from visiteurs;

select	count(age) as nb_valeurs_age_renseignées,
		count(taille) 'Nb valeurs taille renseignées'
		from visiteurs;

select min(age) 'âge min', max(age) 'âge maxi', avg(age) 'âge moyen' from visiteurs;

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








