class Chore < ActiveRecord::Base
    has_many :song_chores
    has_many :songs, :through => :song_chores
    has_many :users, :through => :songs
end