class AddForeignKeyToGalleryItems < ActiveRecord::Migration
  def change
    add_reference :stories, :user
  end
end


