class AddAddressTwoToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :address_two, :string
  end
end
