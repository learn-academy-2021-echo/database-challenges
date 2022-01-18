Favorite Movies Challenge
Setup
Create a new Rails application called 'favorite_movies'.
rails new favorite_movies -d postgresql -T
cd favorite_movies
Create the database
rails db:create
Generate a Movie model with a title attribute and a category attribute
rails generate model Movie title:string category:string   
Challenges
Add five entries to the database via the Rails console
Movie.create title: "x-man", category: "action"
.
.
.
Movie.create title: "hangover", category: "comedy"

Create a migration to add a new column to the database called movie_length
(rails generate migration add_column_movie_length)
(---- !!!ON THE REGULAR TERMINAL, NOT THE CONSOLE!!!)


class MovieLength < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :movie_length, :string
  end
end

$ rails db:migrate

Update the values of the five existing attributes to include a movie_length value

x = Movie.find 1
x.movie_length = "1hr30min"
x.save

Generate a migration to rename the column 'category' to 'genre'

rails generate migration change_category_to_genre

class ChangeCategoryToGenre < ActiveRecord::Migration[6.1]
  def change
    rename_column :movies, :category, :genre
  end
end
