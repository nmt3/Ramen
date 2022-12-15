class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.integer :customer_id, null: false
      t.string :store_name, null: false
      t.boolean :activity_monday, null: false
      t.boolean :activity_tuesday, null: false
      t.boolean :activity_wednesday, null: false
      t.boolean :activity_thursday, null: false
      t.boolean :activity_friday, null: false
      t.boolean :activity_saturday, null: false
      t.boolean :activity_sunday, null: false
      t.boolean :holiday_monday, null: false
      t.boolean :holiday_tuesday, null: false
      t.boolean :holiday_wednesday, null: false
      t.boolean :holiday_thursday, null: false
      t.boolean :holiday_friday, null: false
      t.boolean :holiday_saturday, null: false
      t.boolean :holiday_sunday, null: false

      t.time :open, null: false
      t.time :close, null: false
      t.string :address
      t.string :other
      t.float :latitude
      t.float :longitude
      t.string :telephone_number
      t.timestamps


    end
  end
end
