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
      t.string :holiday
      t.string :business_time
      t.string :address
      t.string :genre
      t.string :post_comment
      t.float :lat
      t.float :lng
      t.timestamps


    end
  end
end
