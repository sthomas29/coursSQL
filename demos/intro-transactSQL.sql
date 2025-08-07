use parc;
/****************
Introduction au Transact SQL
*****************/
-- Manipulations de variables

-- Déclaration d'une variable
declare @nb_attractions int;

-- Affectation d'une valeur à une variable via un select count(*)
select @nb_attractions= count(*) from attractions;

/************ ATTENTION ***********
L'affichage d'un résultat sous forme de tableau (select) empêche l'affichage des chaînes
avec l'instruction PRINT.
*/
-- Affichage de la variable seule ou concaténée avec un texte
	-- select @nb_attractions;
	--select concat('Test', @nb_attractions);

-- Affichage via l'instruction print()
print concat('0-Affichage via d''une variable : ', @nb_attractions);

-- Déclaration d'une variable et affectation d'une chaine de caractère avec concat()
-- Importance de définir une taille (50) dans la définition du type
declare @resultat varchar(50) = CONCAT('1-Nb d''attractions : ', @nb_attractions);
print @resultat;

print concat('2-Nb d''attractions : ',  @nb_attractions)
--print @nb_attractions;

