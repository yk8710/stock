class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.references  :user, null: false, foregn_key: true
      t.string      :name, null: false
      t.string      :best_before
      t.string      :location
      t.integer     :category_id, null: false
      t.integer     :quantity
      t.timestamps
    end
  end
end
