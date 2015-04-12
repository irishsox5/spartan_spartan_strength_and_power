class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :title
      t.text :description
      t.string :photo
      t.string :video

      t.timestamps null: false
    end
  end
end
