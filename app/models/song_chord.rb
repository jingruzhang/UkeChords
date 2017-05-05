class SongChord < ActiveRecord::Base
    belongs_to :song
    belongs_to :chord
end