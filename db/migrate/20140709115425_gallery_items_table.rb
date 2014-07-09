class GalleryItemsTable < ActiveRecord::Migration
  def change
    create_table :gallery_items do |t|
      t.string :email
      t.string :caption
      t.integer :upvotes
      t.string :final_image
      t.boolean :opt_in

      t.timestamps
    end
  end
end
