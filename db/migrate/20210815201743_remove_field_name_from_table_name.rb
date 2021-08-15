class RemoveFieldNameFromTableName < ActiveRecord::Migration[6.1]
  def change
    remove_column :rides, :departure, :string
    remove_column :rides, :arrival, :string
  end
end
