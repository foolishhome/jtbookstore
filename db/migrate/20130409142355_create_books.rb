class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.integer :id
      t.string :bname
      t.integer :btype
      t.text :bdescript
      t.float :bprice
      t.date :bpublication

      t.timestamps
    end
  end
end
