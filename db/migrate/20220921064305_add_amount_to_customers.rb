class AddAmountToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :amount, :integer
  end
end
