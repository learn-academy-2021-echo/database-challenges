> rails new favorite_movies -d postgresql -T

>rails db:create
    Running via Spring preloader in process 15521
    Created database 'favorite_movies_development'
    Created database 'favorite_movies_test'


>rails generate model Movie title:string category:string
    Running via Spring preloader in process 15582
      invoke  active_record
      create    db/migrate/20220114192434_create_movies.rb
      create    app/models/movie.rb

rails db:migrate
    Running via Spring preloader in process 15679
    == 20220114192434 CreateMovies: migrating =====================================
    -- create_table(:movies)
   -> 0.0222s
    == 20220114192434 CreateMovies: migrated (0.0224s) ============================ 

> rails generate migration add_column_to_list
Running via Spring preloader in process 15773
      invoke  active_record
      create    db/migrate/20220114193823_add_column_to_list.rb



>rails generate migration add_column_to_list
    Running via Spring preloader in process 15773
      invoke  active_record
      create    db/migrate/20220114193823_add_column_to_list.rb


> db:migrate
    Running via Spring preloader in process 15943
    == 20220114193823 AddColumnToList: migrating ==================================
    -- add_column(:movies, :movie_length, :string)
    -> 0.0238s
    == 20220114193823 AddColumnToList: migrated (0.0242s) =========================

