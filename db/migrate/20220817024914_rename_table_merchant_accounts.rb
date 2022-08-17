class RenameTableMerchantAccounts < ActiveRecord::Migration[5.2]
  def change
    rename_table :merchant_accounts, :merchants
  end
end
