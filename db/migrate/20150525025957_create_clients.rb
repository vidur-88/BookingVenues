class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :email_id
      t.string :contact_no
      t.string :address

      t.timestamps
    end
  end
end
