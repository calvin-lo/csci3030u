/* Lab7 a*/
SELECT AVG(DATE_PART('year', age("Date_of_Birth"))) AS "Average_Age" FROM "Actors"

/*Lab7 b*/
SELECT count(DISTINCT "Country") FROM "Act"
INNER JOIN "Movies" ON "Movies"."movie_id" = "Act"."movie_id"
INNER JOIN "Actors" ON "Actors"."actor_id" = "Act"."actor_id"
INNER JOIN "Locations" ON "Locations"."location_id" = "Actors"."Place_of_Birth_id"
WHERE "Movies"."Title" = 'Bridge of Spies'


/*Lab7 c*/
SELECT count("actor_id") FROM "Actors"
WHERE "Eye_Color" = 'Green'

/*Lab7 d*/
SELECT COUNT("Movies"."movie_id") FROM "Act"
INNER JOIN "Movies" ON "Movies"."movie_id" = "Act"."movie_id"
INNER JOIN "Actors" ON "Actors"."actor_id" = "Act"."actor_id"
WHERE "Actors"."Name" = 'Anne' AND "Actors"."Surename" = 'Hathaway'

/*Lab7 e*/
SELECT "Genre"."Type", 
CAST(MIN(CAST("Movies"."Budget" AS DECIMAL)) AS MONEY) AS "Min", 
CAST(AVG(CAST("Movies"."Budget" AS DECIMAL)) AS MONEY) AS "Avg", 
CAST(MAX(CAST("Movies"."Budget" AS DECIMAL)) AS MONEY) AS "Max" 
FROM "Movies"
INNER JOIN "Genre" ON "Movies"."genre_id" = "Genre"."genre_id"
GROUP BY "Genre"."Type"

/*Lab7 f*/
SELECT "Directors"."Name" , "Title" ,"Rating" FROM "Direct"
INNER JOIN "Movies" ON "Movies"."movie_id" = "Direct"."movie_id"
INNER JOIN "Directors" ON "Directors"."director_id" = "Direct"."director_id"
WHERE 
("Directors"."Place_of_Birth_id" IN (SELECT "location_id" 
FROM "Locations" WHERE
"Locations"."City" = 'London') OR
"Directors"."Eye_Color" = 'Blue')

/*Lab7 g*/
SELECT "Title" FROM "Act"
INNER JOIN "Movies" ON "Movies"."movie_id" = "Act"."movie_id"
INNER JOIN "Actors" ON "Actors"."actor_id" = "Act"."actor_id"
INNER JOIN "Locations" ON "Locations"."location_id" = "Actors"."Place_of_Birth_id"
GROUP BY "Title"
HAVING COUNT(DISTINCT("Country")) >= 2

/*Lab7 h*/
/*Find the number of movies for every actor from UK acted*/
Select "Actors"."Name", "Actors"."Surename", 
			(SELECT COUNT("Act"."actor_id") FROM "Act" 
			 WHERE "Actors"."actor_id" = "Act"."actor_id")
FROM "Actors"
INNER JOIN "Locations" ON "Actors"."Place_of_Birth_id" = "Locations"."location_id"
WHERE "Country" = 'UK'



