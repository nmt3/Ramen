class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.integer :customer_id, null: false
      t.string :store_name, null: false
      t.string :business_day, null: false
      t.string :opening_time, null: false
      t.string :closing_time, null: false
      t.string :holiday, null: false
      t.string :address, null: false
      t.string :other, null: false
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.string :telephone_number, null: false
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
