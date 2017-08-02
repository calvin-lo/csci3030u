/*
Created: 9/29/2015
Modified: 11/2/2015
Model: PostgreSQL 9.4
Database: PostgreSQL 9.4
*/


-- Create tables section -------------------------------------------------

-- Table Movies

CREATE TABLE "Movies"(
 "movie_id" Integer NOT NULL,
 "genre_id" Integer,
 "Title" Character varying(40) NOT NULL,
 "ReleaseDate" Date NOT NULL,
 "Rating" Integer NOT NULL,
 "Budget" Money,
 "Box_Office" Money,
 "Language" Character varying(20)
)
;

-- Create indexes for table Movies

CREATE UNIQUE INDEX "Unique_Movie" ON "Movies" ("movie_id")
;

CREATE INDEX "IX_Relationship5" ON "Movies" ("genre_id")
;

-- Add keys for table Movies

ALTER TABLE "Movies" ADD CONSTRAINT "Key1" PRIMARY KEY ("movie_id")
;

-- Table Directors

CREATE TABLE "Directors"(
 "director_id" Integer NOT NULL,
 "Place_of_Birth_id" Integer,
 "Name" Character varying(40) NOT NULL,
 "Surename" Character varying(40),
 "Date_of_Birth" Date
)
;

-- Create indexes for table Directors

CREATE UNIQUE INDEX "Unique_Director" ON "Directors" ("director_id")
;

CREATE INDEX "IX_Relationship2" ON "Directors" ("Place_of_Birth_id")
;

-- Add keys for table Directors

ALTER TABLE "Directors" ADD CONSTRAINT "Key2" PRIMARY KEY ("director_id")
;

-- Table Actors

CREATE TABLE "Actors"(
 "actor_id" Integer NOT NULL,
 "Place_of_Birth_id" Integer,
 "Name" Character varying(40) NOT NULL,
 "Surename" Character varying(40),
 "Date_of_Birth" Date
)
;

-- Create indexes for table Actors

CREATE UNIQUE INDEX "Unique_Actor" ON "Actors" ("actor_id")
;

CREATE INDEX "IX_Relationship4" ON "Actors" ("Place_of_Birth_id")
;

-- Add keys for table Actors

ALTER TABLE "Actors" ADD CONSTRAINT "Key3" PRIMARY KEY ("actor_id")
;

-- Table Act

CREATE TABLE "Act"(
 "movie_id" Integer NOT NULL,
 "actor_id" Integer NOT NULL
)
;

-- Add keys for table Act

ALTER TABLE "Act" ADD CONSTRAINT "act_key" PRIMARY KEY ("movie_id","actor_id")
;

-- Table Direct

CREATE TABLE "Direct"(
 "movie_id" Integer NOT NULL,
 "director_id" Integer NOT NULL
)
;

-- Add keys for table Direct

ALTER TABLE "Direct" ADD CONSTRAINT "Key6" PRIMARY KEY ("movie_id","director_id")
;

-- Table Locations

CREATE TABLE "Locations"(
 "location_id" Integer NOT NULL,
 "City" Character varying(40),
 "State" Character varying(40),
 "Country" Character varying(40)
)
;

-- Create indexes for table Locations

CREATE UNIQUE INDEX "Unique_Location" ON "Locations" ("location_id")
;

-- Add keys for table Locations

ALTER TABLE "Locations" ADD CONSTRAINT "Key4" PRIMARY KEY ("location_id")
;

-- Table Genre

CREATE TABLE "Genre"(
 "genre_id" Integer NOT NULL,
 "Type" Character varying(20),
 "Description" Text
)
;

-- Add keys for table Genre

ALTER TABLE "Genre" ADD CONSTRAINT "Key9" PRIMARY KEY ("genre_id")
;

-- Table Writers

CREATE TABLE "Writers"(
 "writer_id" Integer NOT NULL,
 "Place_of_Birth_id" Integer,
 "Name" Character varying(40) NOT NULL,
 "Surename" Character varying(40),
 "Date_of_Birth" Date
)
;

-- Create indexes for table Writers

CREATE INDEX "IX_Relationship8" ON "Writers" ("Place_of_Birth_id")
;

CREATE INDEX "Unique_Writer" ON "Writers" ("writer_id")
;

-- Add keys for table Writers

ALTER TABLE "Writers" ADD CONSTRAINT "Key10" PRIMARY KEY ("writer_id")
;

-- Table Write

CREATE TABLE "Write"(
 "movie_id" Integer NOT NULL,
 "writer_id" Integer NOT NULL
)
;

-- Add keys for table Write

ALTER TABLE "Write" ADD CONSTRAINT "Key11" PRIMARY KEY ("movie_id","writer_id")
;

-- Create relationships section ------------------------------------------------- 

ALTER TABLE "Act" ADD CONSTRAINT "Acted by" FOREIGN KEY ("movie_id") REFERENCES "Movies" ("movie_id") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "Act" ADD CONSTRAINT "Acted" FOREIGN KEY ("actor_id") REFERENCES "Actors" ("actor_id") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "Direct" ADD CONSTRAINT "Directed by" FOREIGN KEY ("movie_id") REFERENCES "Movies" ("movie_id") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "Direct" ADD CONSTRAINT "Directed" FOREIGN KEY ("director_id") REFERENCES "Directors" ("director_id") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "Directors" ADD CONSTRAINT "Director Born" FOREIGN KEY ("Place_of_Birth_id") REFERENCES "Locations" ("location_id") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "Actors" ADD CONSTRAINT "Actor Born" FOREIGN KEY ("Place_of_Birth_id") REFERENCES "Locations" ("location_id") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "Movies" ADD CONSTRAINT "Type" FOREIGN KEY ("genre_id") REFERENCES "Genre" ("genre_id") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "Write" ADD CONSTRAINT "Wrote by" FOREIGN KEY ("movie_id") REFERENCES "Movies" ("movie_id") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "Write" ADD CONSTRAINT "Wrote" FOREIGN KEY ("writer_id") REFERENCES "Writers" ("writer_id") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "Writers" ADD CONSTRAINT "Writer Born" FOREIGN KEY ("Place_of_Birth_id") REFERENCES "Locations" ("location_id") ON DELETE NO ACTION ON UPDATE NO ACTION
;





