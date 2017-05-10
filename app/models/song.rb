class Song < ActiveRecord::Base

    extend Slugifiable::ClassMethods
    include Slugifiable::InstanceMethods
    
    belongs_to :user
    has_many :song_chords
    has_many :chords, :through => :song_chords

    validates :name, presence: true
end