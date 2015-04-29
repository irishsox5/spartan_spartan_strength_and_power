class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.belongs_to :program, index: true

      t.timestamps null: false
    end
    add_foreign_key :memberships, :programs
  end
end
