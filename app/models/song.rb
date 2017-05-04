class Song < ActiveRecord::Base
    belongs_to :user
    has_many :song_chores
    has_many :chores, :through => :song_chores
end