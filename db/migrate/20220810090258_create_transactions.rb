class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.references :voucher
      t.integer :amount
      t.references :merchant
      t.references :user

      t.timestamps
    end
  end
end
