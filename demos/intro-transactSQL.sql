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

print concat('2-Nb d''attractions : ',  @nb_attractions)
--print @nb_attractions;

