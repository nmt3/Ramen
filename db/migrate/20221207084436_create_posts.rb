class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.integer :customer_id, null: false
      t.string :store_name, null: false
      t.string :business_day
      t.string :opening_time
      t.string :closing_time
      t.string :holiday
      t.string :address
      t.string :other
      t.float :latitude
      t.float :longitude
      t.string :telephone_number
      t.timestamps

      t.boolean :activity_monday
      t.boolean :activity_tuesday
      t.boolean :activity_wednesday
      t.boolean :activity_thursday
      t.boolean :activity_friday
      t.boolean :activity_staurday
      t.boolean :activity_sanday

    end
  end
end
