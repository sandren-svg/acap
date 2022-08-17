class CreateMerchantsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :merchants_users do |t|
      t.references :merchant
      t.references :user
      t.string :status
      t.string :role
      t.timestamps
    end
  end
end
