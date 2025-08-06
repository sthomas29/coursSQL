use parc;
go

select * from attractions;

-- Affichage du nb d'attractions par type d'attraction 
select type, count(type) from attractions
				group by type;
;

