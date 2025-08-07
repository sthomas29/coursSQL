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

print concat('2-Nb d''attractions : ',  @nb_attractions);
--print @nb_attractions;

/********** Les conditions avec Transact *****/
-- Affectation de la valeur 19 ici pour tester le bloc ELSE
-- à commenter pour tester le bloc IF
select @nb_attractions=19;

-- Bloc conditionnel selon une valeur de variable
if @nb_attractions = 20
-- Les instructions BEGIN... END servent à définir un bloc de code, impératif
-- pour les conditions et les boucles.
begin
	print concat('Il y a bien ',@nb_attractions, ' attractions dans le parc');
end
else
begin
	print concat('Il n''y a plus 20 attractions, il y en a ',@nb_attractions, ' dans le parc');
end


