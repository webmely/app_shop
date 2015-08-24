class AddEmailToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :email, :string
    add_column :orders, :phone, :string
  end
end
