class AddPriceToOrderdetails < ActiveRecord::Migration
  def change
    add_column :orderdetails, :price, :float
    
  end
end
