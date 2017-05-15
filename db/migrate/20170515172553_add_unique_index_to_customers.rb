class AddUniqueIndexToCustomers < ActiveRecord::Migration
  def change
    add_index :customers, [:address, :city], unique: true
  end
end
