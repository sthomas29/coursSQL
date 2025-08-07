use parc;
/****************
Introduction au Transact SQL
*****************/
-- Manipulations de variables

-- D�claration d'une variable
declare @nb_attractions int;

-- Affectation d'une valeur � une variable via un select count(*)
select @nb_attractions= count(*) from attractions;

/************ ATTENTION ***********
L'affichage d'un r�sultat sous forme de tableau (select) emp�che l'affichage des cha�nes
avec l'instruction PRINT.
*/
-- Affichage de la variable seule ou concat�n�e avec un texte
	-- select @nb_attractions;
	--select concat('Test', @nb_attractions);

-- Affichage via l'instruction print()
print concat('0-Affichage via d''une variable : ', @nb_attractions);

-- D�claration d'une variable et affectation d'une chaine de caract�re avec concat()
-- Importance de d�finir une taille (50) dans la d�finition du type
declare @resultat varchar(50) = CONCAT('1-Nb d''attractions : ', @nb_attractions);
print @resultat;

print concat('2-Nb d''attractions : ',  @nb_attractions);
--print @nb_attractions;

/********** Les conditions avec Transact *****/
-- Affectation de la valeur 19 ici pour tester le bloc ELSE
-- � commenter pour tester le bloc IF
select @nb_attractions=19;

-- Bloc conditionnel selon une valeur de variable
if @nb_attractions = 20
-- Les instructions BEGIN... END servent � d�finir un bloc de code, imp�ratif
-- pour les conditions et les boucles.
begin
	print concat('Il y a bien ',@nb_attractions, ' attractions dans le parc');
end
else
begin
	print concat('Il n''y a plus 20 attractions, il y en a ',@nb_attractions, ' dans le parc');
end


