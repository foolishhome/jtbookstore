class CreateActors < ActiveRecord::Migration
  def change
    create_table :actors do |t|
      t.integer :id
      t.string :name
      t.integer :sex
      t.integer :achievement
      t.integer :points
      t.integer :devote
      t.integer :levels

      t.timestamps
    end
  end
end
