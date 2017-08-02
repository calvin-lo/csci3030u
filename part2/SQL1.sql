/* Lab6 a*/
SELECT "Name", "Surename" FROM "Directors", "Locations"
WHERE "location_id" = "Place_of_Birth_id" AND
"Country" = 'Canada'

/* Lab6 b*/
SELECT "Title" FROM "Direct"
INNER JOIN "Movies" ON "Movies"."movie_id" = "Direct"."movie_id"
INNER JOIN "Directors" ON "Directors"."director_id" = "Direct"."director_id"
WHERE "Directors"."Name" = 'Steven' AND "Directors"."Surename" = 'Spielberg'

/* Lab6 c*/
SELECT "Name","Surename", ("Budget" * 1.311) AS "CAD" FROM "Act"
INNER JOIN "Movies" ON "Movies"."movie_id" = "Act"."movie_id"
INNER JOIN "Actors" ON "Actors"."actor_id" = "Act"."actor_id"
WHERE "Movies"."Budget" >= '1000000'

SELECT "Name","Surename", ("Budget" * 121.165) AS "JPY" FROM "Act"
INNER JOIN "Movies" ON "Movies"."movie_id" = "Act"."movie_id"
INNER JOIN "Actors" ON "Actors"."actor_id" = "Act"."actor_id"
WHERE"Movies"."Budget" >= '1000000'

SELECT "Name","Surename", ("Budget" * 62.89) AS "RUB" FROM "Act"
INNER JOIN "Movies" ON "Movies"."movie_id" = "Act"."movie_id"
INNER JOIN "Actors" ON "Actors"."actor_id" = "Act"."actor_id"
WHERE "Movies"."Budget" >= '1000000'

SELECT "Name","Surename", ("Budget" * 0.91) AS "EUR" FROM "Act"
INNER JOIN "Movies" ON "Movies"."movie_id" = "Act"."movie_id"
INNER JOIN "Actors" ON "Actors"."actor_id" = "Act"."actor_id"
WHERE "Movies"."Budget" >= '1000000'

SELECT "Name","Surename", ("Budget" * 0.99) AS "CHF" FROM "Act"
INNER JOIN "Movies" ON "Movies"."movie_id" = "Act"."movie_id"
INNER JOIN "Actors" ON "Actors"."actor_id" = "Act"."actor_id"
WHERE "Movies"."Budget" >= '1000000'

/* Lab6 d*/
SELECT "Name", "Surename" FROM "Directors"
WHERE "Surename" LIKE 'A%' OR "Surename" LIKE 'D%'

/* Lab6 e*/
SELECT "Title", "Name", "Surename" FROM "Act"
INNER JOIN "Movies" ON "Movies"."movie_id" = "Act"."movie_id"
INNER JOIN "Actors" ON "Actors"."actor_id" = "Act"."actor_id"
INNER JOIN "Genre" ON "Genre"."genre_id" = "Movies"."genre_id"
WHERE "Genre"."Type" = 'Comedy' AND
DATE_PART('year', age("Date_of_Birth")) < 40

/* Lab6 f*/
SELECT A1."Surename", A2."Surename" FROM "Actors" A1, "Actors" A2
WHERE A1."Eye_Color" = 'Blue' AND A2."Eye_Color" = 'Blue' AND
A1."Surename" < A2."Surename"
