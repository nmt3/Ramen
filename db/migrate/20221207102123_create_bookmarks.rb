class CreateBookmarks < ActiveRecord::Migration[6.1]
  def change
    create_table :bookmarks do |t|
      t.references :customer, foreign_key: true, null: false
      t.references :post, foreign_key: true, null: false

      t.timestamps
    end
  end
end
