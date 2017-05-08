# UkeChords
A full scale Sinatra app that helps ‘Ukulele players/learners to build a personalized library of songs and to keep track of the chords in each song. 

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
The goal of this portfolio project is to build UkeChords, an app that helps ‘Ukulele players/learners to build a personalized library of songs and to keep track of the chords in each song. 

# Install
Clone/Download to your computer. Type bundle install in command line to install the gems. Run 'rake db:migrate' if prompted. Run 'shotgun' and open "localhost:9393" to run.

# User Story
As a ‘Ukulele learner myself, I am struggling with organizing my music charts and keeping track of the chords that I’ve learned. I want an app that helps me stay organized with my growing list of music sheets and allows me to search through my music sheets for chords that I would like to practice more. 

# User Journey
As a user registers and creates an account with UkeChords, they can start creating a song by entering the name of the song and the chords used in the song. 

A user shouldn’t be able to take any action(create, view, edit, delete) unless they are logged in. Once a user is logged in, they will have a personal home page that displays all the chords and all the songs they have saved. 

A user has two ways to navigate through their personal library: 1)Search by chords: click on one chord and see a list of songs that have that chord; 2)Search by songs: click on one song and see a list of chords in the song. The app will also display chord charts to help users memorize finger placement with each chord in each song. 

For copyright reasons, the app doesn’t display music sheets. It’s a list app that helps users to organize their own collection of music sheets. 

