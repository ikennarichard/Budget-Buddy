class CreateSalesGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :sales_groups do |t|
      t.references :sale, foreign_key: true, index: true
      t.references :group, foreign_key: true, index: true

      t.timestamps
    end
  end
end
