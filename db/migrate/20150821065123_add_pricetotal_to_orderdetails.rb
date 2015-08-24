class AddPricetotalToOrderdetails < ActiveRecord::Migration
  def change
    add_column :orderdetails, :price_total, :float
  end
end
