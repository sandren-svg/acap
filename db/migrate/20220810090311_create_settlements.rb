class CreateSettlements < ActiveRecord::Migration[5.2]
  def change
    create_table :settlements do |t|
      t.integer :amount
      t.references :merchant

      t.timestamps
    end
  end
end
