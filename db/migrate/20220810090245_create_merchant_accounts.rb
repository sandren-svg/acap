class CreateMerchantAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :merchant_accounts do |t|
      t.string :name
      t.string :phone_no
      t.string :reg_no
      t.string :email
      t.references :brand

      t.timestamps
    end
  end
end
