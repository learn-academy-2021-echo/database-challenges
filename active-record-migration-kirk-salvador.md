## Setup

#### Create a new Rails application called 'favorite_movies'.

`$ rails new favorite_movies -d postgresql -T`

#### Create the database

`$ rails db:create`

#### Generate a Movie model with a title attribute and a category attribute

`$ rails generate model Movie title:string category:string`

## Challenges

#### Add five entries to the database via the Rails console

```Shell
$ rail c
$ Movie.create([{title:'The Matrix', category:'Sci-fi'}, {title:'Selena', category:'Biography'}, {title:'Lord Of The Rings: Two Towers', category:'Fantasy'}, {title:'Oceans 11', category:'Heist'}, {title:'Moneyball', category:'Sports'}])
```

#### Create a migration to add a new column to the database called movie_length

```Shell
$ exit
$ rails generate migration add_new_column_called_movie_length
```

```Ruby
class AddNewColumnCalledMovieLength < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :movie_length, :integer
  end
end
```

```Shell
$ rails db:migrate
```

#### Update the values of the five existing attributes to include a movie_length value

```Shell
$ rails c
$ matrix = Movie.find 1
$ selena = Movie.find 2
$ lord = Movie.find 3
$ oceans = Movie.find 4
$ money = Movie.find 5
$ matrix.update movie_length:136
$ selena.update movie_length:127
$ lord.update movie_length:179
$ oceans.update movie_length:117
$ money.update movie_length:133
```

#### Generate a migration to rename the column 'category' to 'genre'

```Shell
$ exit
$ rails generate migration rename_column_category_to_genre
```

```Ruby
class RenameColumnCategoryToGenre < ActiveRecord::Migration[6.1]
  def change
    rename_column :movies, :category, :genre
  end
end
```

```Shell
$ rails db:migrate
```
