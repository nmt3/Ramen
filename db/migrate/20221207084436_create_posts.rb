class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.integer :customer_id, null: false
      t.string :store_name, null: false
      t.string :business_day
      t.string :business_hours
      t.string :regular_holiday
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :telephone_number
      t.timestamps
    end
  end
end
