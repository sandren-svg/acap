class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :merchant
      t.references :brand
      t.string :name
      t.string :description
      t.string :image
      t.integer :price
      t.boolean :active

      t.timestamps
    end
  end
end
