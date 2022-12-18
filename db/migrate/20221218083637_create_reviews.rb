class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|

      t.integer :customer_id, null: false
      t.integer :post_id, null: false
      t.integer :star, null:false
      t.text :review_comment, null: false

      t.timestamps
    end
  end
end
