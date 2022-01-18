Favorite Movies Challenge
Setup

    Create a new Rails application called 'favorite_movies'.

    rails new favorite_movies -d postgresql -T

    Create the database

    learnacademy@LEARNs-MacBook-Air favorite_movies % rails db:create
    Running via Spring preloader in process 74410
    Created database 'favorite_movies_development'
    Created database 'favorite_movies_test'

    Generate a Movie model with a title attribute and a category attribute

    learnacademy@LEARNs-MacBook-Air favorite_movies % rails generate model Movies title:string category:string
Running via Spring preloader in process 74655
[WARNING] The model name 'Movies' was recognized as a plural, using the singular 'Movie' instead. Override with --force-plural or setup custom inflection rules for this noun before running the generator.
      invoke  active_record
      create    db/migrate/20220114192213_create_movies.rb
      create    app/models/movie.rb

Challenges

    Add five entries to the database via the Rails console

    Movie.create title:"The Town", category:"boston crime drama"
    Movie.create title:"Coco", category:"pixar film"
    Movie.create title:"Good Will Hunting", category:"boston drama"
    Movie.create title:"Mystic River", category:"boston crime drama"
     Movie.create title:"The Departed", category:"boston crime drama"

    Create a migration to add a new column to the database called movie_length

    learnacademy@LEARNs-MacBook-Air favorite_movies % rails generate migration add_columns_to_list
Running via Spring preloader in process 74850
      invoke  active_record
      create    db/migrate/20220114193555_add_columns_to_list.rb

      learnacademy@LEARNs-MacBook-Air favorite_movies % rails db:migrate
Running via Spring preloader in process 75135
== 20220114193555 AddColumnsToList: migrating =================================
-- add_column(:movies, :movie_length, :string)
   -> 0.1661s
== 20220114193555 AddColumnsToList: migrated (0.1671s) ========================

    Update the values of the five existing attributes to include a movie_length value

   .0.0 :011 > coco = Movie.find 5
  Movie Load (84.6ms)  SELECT "movies".* FROM "movies" WHERE "movies"."id" = $1 LIMIT $2  [["id", 5], ["LIMIT", 1]]
 => #<Movie id: 5, title: "Coco", category: "pixar film", created_at: "2022-01-14 19:32:28.031226000 +0000",...
3.0.0 :012"> coco.update movie_length:"1h 45m"
  TRANSACTION (354.8ms)  BEGIN
  Movie Update (360.0ms)  UPDATE "movies" SET "updated_at" = $1, "movie_length" = $2 WHERE "movies"."id" = $3  [["updated_at", "2022-01-14 19:54:31.040082"], ["movie_length", "1h 45m"], ["id", 5]]
  TRANSACTION (32.8ms)  COMMIT
 => true
3.0.0 :013 > pp Movie.all
  Movie Load (1.6ms)  SELECT "movies".* FROM "movies"
[#<Movie:0x00007fe71c4dc668
  id: 1,
  title: "The Town",
  category: "boston crime drama",
  created_at: Fri, 14 Jan 2022 19:26:23.969578000 UTC +00:00,
  updated_at: Fri, 14 Jan 2022 19:50:10.438056000 UTC +00:00,
  movie_length: "2h 30m">,
 #<Movie:0x00007fe71c4dc5a0
  id: 2,
  title: "The Departed",
  category: "boston crime drama",
  created_at: Fri, 14 Jan 2022 19:28:26.905330000 UTC +00:00,
  updated_at: Fri, 14 Jan 2022 19:51:47.007929000 UTC +00:00,
  movie_length: "2h 31m">,
 #<Movie:0x00007fe71c4dc4d8
  id: 3,
  title: "Mystic River",
  category: "boston crime drama",
  created_at: Fri, 14 Jan 2022 19:30:19.109079000 UTC +00:00,
  updated_at: Fri, 14 Jan 2022 19:53:26.806425000 UTC +00:00,
  movie_length: "2h 17m">,
 #<Movie:0x00007fe71c4dc410
  id: 4,
  title: "Good Will Hunting",
  category: "boston drama",
  created_at: Fri, 14 Jan 2022 19:31:56.633527000 UTC +00:00,
  updated_at: Fri, 14 Jan 2022 19:54:02.892858000 UTC +00:00,
  movie_length: "2h 6m">,
 #<Movie:0x00007fe71c4dc348
  id: 5,
  title: "Coco",
  category: "pixar film",
  created_at: Fri, 14 Jan 2022 19:32:28.031226000 UTC +00:00,
  updated_at: Fri, 14 Jan 2022 19:54:31.040082000 UTC +00:00,
  movie_length: "1h 45m">]

    Generate a migration to rename the column 'category' to 'genre'

learnacademy@LEARNs-MacBook-Air favorite_movies % rails generate migration change_name_of_category_to_drama
Running via Spring preloader in process 75311
      invoke  active_record
      create    db/migrate/20220114195735_change_name_of_category_to_drama.rb
learnacademy@LEARNs-MacBook-Air favorite_movies % rails db:migrate
Running via Spring preloader in process 75416
== 20220114195735 ChangeNameOfCategoryToDrama: migrating ======================
-- rename_column(:movies, :category, :genre)
   -> 0.0321s
== 20220114195735 ChangeNameOfCategoryToDrama: migrated (0.0339s) =============

class ChangeNameOfCategoryToDrama < ActiveRecord::Migration[6.1]
  def change
    rename_column :movies, :category, :genre
  end
end
