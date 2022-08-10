class CreateVouchers < ActiveRecord::Migration[5.2]
  def change
    create_table :vouchers do |t|
      t.references  :merchant
      t.references  :brand
      t.string :name
      t.string :description
      t.string :image
      t.datetime  :start_date
      t.datetime  :expiry_date
      t.integer :amount
      t.integer :amount_used
      t.interger :capped_amount
      t.interger :min_purchase
      t.references :credit

      t.timestamps
    end
  end
end
