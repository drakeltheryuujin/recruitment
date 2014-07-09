class AddForeignKeyToGalleryItems < ActiveRecord::Migration
  def change
    add_reference :gallery_items, :user
  end
end
