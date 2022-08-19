class CreateMemos < ActiveRecord::Migration[6.0]
  def change
    create_table :memos do |t|
      t.references               :user, null: false, foregn_key: true
      t.string                   :name, null: false
      t.string                   :contents
      t.timestamps
    end
  end
end
