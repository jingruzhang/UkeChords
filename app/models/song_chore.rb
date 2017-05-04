class SongChore < ActiveRecord::Base
    belongs_to :song
    belongs_to :chore
end