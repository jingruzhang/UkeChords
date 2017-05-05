class Chord < ActiveRecord::Base

    extend Slugifiable::ClassMethods
    include Slugifiable::InstanceMethods
    
    has_many :song_chords
    has_many :songs, :through => :song_chords
    has_many :users, :through => :songs
end