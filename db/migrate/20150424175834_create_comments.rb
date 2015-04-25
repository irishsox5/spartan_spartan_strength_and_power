class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :blog_id
      t.string :name

      t.timestamps null: false
    end
  end
end
