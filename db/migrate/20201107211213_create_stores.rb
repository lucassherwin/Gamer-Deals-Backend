class CreateStores < ActiveRecord::Migration[6.0]
  def change
    create_table :stores do |t|
      t.belongs_to :game, null: false, foreign_key: true
      t.string :name
      t.float :price
      t.string :link

      t.timestamps
    end
  end
end
