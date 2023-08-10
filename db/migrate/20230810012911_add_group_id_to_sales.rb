class AddGroupIdToSales < ActiveRecord::Migration[7.0]
  def change
    add_reference :sales, :group, null: false, foreign_key: true, index: true
  end
end
