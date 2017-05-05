class RenameChords < ActiveRecord::Migration[5.1]
  def change
    rename_table :chores, :chords
  end
end
