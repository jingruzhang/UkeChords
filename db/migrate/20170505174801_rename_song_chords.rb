class RenameSongChords < ActiveRecord::Migration[5.1]
  def change
    rename_table :song_chores, :song_chords
  end
end
