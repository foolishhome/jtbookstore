class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.integer :id
      t.string :sname
      t.integer :stype
      t.text :sdescript

      t.timestamps
    end
  end
end
