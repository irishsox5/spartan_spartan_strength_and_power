class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :first_name
      t.string :last_name
      t.belongs_to :blog, index: true
      t.text :content

      t.timestamps null: false
    end
    add_foreign_key :comments, :blogs
  end
end
