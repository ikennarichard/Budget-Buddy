class RemoveStringFromGroups < ActiveRecord::Migration[7.0]
  def change
    remove_column :groups, :string, :string
  end
end
