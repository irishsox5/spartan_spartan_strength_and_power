class RemovePhotoFromGallery < ActiveRecord::Migration
  def change
    remove_column :galleries, :photo, :string
  end
end
