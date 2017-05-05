class RenameColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :song_chords, :chore_id, :chord_id
  end
end
