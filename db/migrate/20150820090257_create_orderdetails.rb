class CreateOrderdetails < ActiveRecord::Migration
  def change
    create_table :orderdetails do |t|
      t.references :order, index: true, foreign_key: true
      t.string :productname
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
