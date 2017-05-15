class AddZipcodeToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :zipcode, :string
  end
end
