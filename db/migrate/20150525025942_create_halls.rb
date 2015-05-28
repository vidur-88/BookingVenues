class CreateHalls < ActiveRecord::Migration
  def change
    create_table :halls do |t|
	  
	  t.string :name
      t.integer :capacity
      t.decimal :rate
      t.string :location
      t.string :address

      t.timestamps

    end
  end
end
