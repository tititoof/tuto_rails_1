class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.references :article, index: true

      t.timestamps null: false
    end
    add_foreign_key :albums, :articles
  end
end
