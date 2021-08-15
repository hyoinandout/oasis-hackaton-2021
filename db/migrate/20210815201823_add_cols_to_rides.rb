class AddColsToRides < ActiveRecord::Migration[6.1]
  def change
    add_column :rides, :departure, :integer
    add_column :rides, :arrival, :integer
  end
end
