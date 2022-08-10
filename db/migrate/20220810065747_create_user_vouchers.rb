class CreateUserVouchers < ActiveRecord::Migration[5.2]
  def change
    create_table :user_vouchers do |t|

      t.timestamps
    end
  end
end
