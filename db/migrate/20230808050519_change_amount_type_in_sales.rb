class ChangeAmountTypeInSales < ActiveRecord::Migration[7.0]
  def change
    change_column :sales, :amount, :float
  end
end
