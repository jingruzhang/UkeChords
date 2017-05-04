# UkeChores
A full scale Sinatra app that helps ‘Ukulele players/learners to build a personalized library of songs and to keep track of the chores in each song. 

# Objectives 
1. Build a full scale Sinatra App that uses:
- A sqlite database
- MVC structure
- ActiveRecord
- RESTful routes
- Sessions
- Login/Logout
- bcrypt password security

# Overview
The goal of this portfolio project is to build UkeChores, an app that helps ‘Ukulele players/learners to build a personalized library of songs and to keep track of the chores in each song. 

# User Story
As a ‘Ukulele learner myself, I am struggling with organizing my music charts and keeping track of the chores that I’ve learned. I want an app that helps me stay organized with my growing list of music sheets and allows me to search through my music sheets for chores that I would like to practice more. 

# User Journey
As a user registers and creates an account with UkeChores, they can start creating a song by entering the name of the song and the chores used in the song. 

A user shouldn’t be able to take any action(create, view, edit, delete) unless they are logged in. Once a user is logged in, they will have a personal home page that displays all the chores and all the songs they have saved. 

A user has two ways to navigate through their personal library: 1)Search by chores: click on one chore and see a list of songs that have that chore; 2)Search by songs: click on one song and see a list of chores in the song. The app will also display chore charts to help users memorize finger placement with each chore in each song. 

For copyright reasons, the app doesn’t display music sheets. It’s a list app that helps users to organize their own collection of music sheets. 

# File Structure 
~~ ├── CONTRIBUTING.md
~~ ├── Gemfile
~~ ├── Gemfile.lock
~~ ├── LICENSE.md
~~ ├── README.md
~~ ├── spec.md
~~ ├── Rakefile
~~ ├── app
~~ │   ├── controllers
~~ │   │   ├── songs_controller.rb
~~ │   │   ├── users_controller.rb
~~ │   │   └── application_controller.rb
~~ │   ├── models
~~ │   │   ├── chore.rb
~~ │   │   ├── song.rb
~~ │   │   ├── user.rb
~~ │   │   └── song_chore.rb
~~ │   └── views
~~ │       ├── index.erb
~~ │       ├── layout.erb
~~ │       ├── chores
~~ │       │   ├── show_chore.erb
~~ │       ├── songs
~~ │       │   ├── create_song.erb
~~ │       │   ├── edit_song.erb
~~ │       │   ├── show_song.erb
~~ │       │   └── songs.erb
~~ │       └── users
~~ │           ├── create_user.erb
~~ │           ├── index.erb
~~ │           └── login.erb
~~ ├── config
~~ │   └── environment.rb
~~ ├── config.ru
~~ ├── db
~~ │   ├── development.sqlite
~~ │   ├── migrate
~~ │   │   ├── 01_create_users.rb
~~ │   │   ├── 02_create_chores.rb
~~ │   │   ├── 03_create_songs.rb
~~ │   │   └── 04_create_song_chores.rb
~~ │   ├── schema.rb
~~ │   └── test.sqlite
