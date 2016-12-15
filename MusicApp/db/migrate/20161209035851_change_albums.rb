class ChangeAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :yr, :integer, null: false
    add_column :albums, :band_id, :integer, null: false
    add_column :tracks, :album_id, :integer, null: false
  end
end
