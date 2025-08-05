use parc
go

SELECT * from attractions where taille_minimale_requise <= 130;
SELECT * from attractions where taille_minimale_requise <= 130 AND capacite >= 25;

SELECT * from attractions where capacite >= 25;

SELECT * from attractions where type LIKE 'Sensations%';

SELECT * from visiteurs where id=20;

SELECT * from visiteurs  where taille > 130  AND age < 18;

SELECT * from visiteurs where prenom IN ('Lucie', 'Hugues', 'Hugo', 'Mathis', 'Sophie');

SELECT * from visiteurs where prenom like '%Lucie%'
						OR prenom like '%Hugo%'
						OR prenom like '%Mathis%'
						OR prenom like '%Sophie%';

SELECT * from visiteurs where prenom NOT IN ('Lucie', 'Hugo', 'Mathis', 'Sophie');

SELECT taille, age, nom, prenom from visiteurs order by taille, age, nom;


