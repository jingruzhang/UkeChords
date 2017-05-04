class CreateSongChores < ActiveRecord::Migration[5.1]
  def change
    create_table :song_chores do |t|
        t.integer :song_id
        t.integer :chore_id
    end
  end
end
