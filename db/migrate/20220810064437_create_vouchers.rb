class CreateVouchers < ActiveRecord::Migration[5.2]
  def change
    create_table :vouchers do |t|

      t.timestamps
    end
  end
end
