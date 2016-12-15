class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name, null: false
      t.string :track_type, null: false

      t.timestamps null: false
    end
    add_index :tracks, :name
  end
end
