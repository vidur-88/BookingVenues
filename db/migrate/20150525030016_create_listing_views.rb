class CreateListingViews < ActiveRecord::Migration
  def change
    create_table :listing_views do |t|

      t.integer :imageable_id
      t.string  :imageable_type

      t.timestamps
    end

    add_index :listing_views, :imageable_id

  end
end
