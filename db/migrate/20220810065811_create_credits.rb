class CreateCredits < ActiveRecord::Migration[5.2]
  def change
    create_table :credits do |t|
      t.string :name
      t.references :user
      t.integer :balance
      t.references :voucher
      t.references :brand
      t.references :institution

      t.timestamps
    end
  end
end
