class CartController < ApplicationController
	def index
	end

	#function add to cart
  def add_to_cart
  	if session["cart"].nil?
  		session["cart"] = []
  	end
  	#So luong cua san pham add vao gio hang
  	quantity_ = 1
  	session["item"] = {:id => params[:id].to_i, :name => params[:name], :quantity => quantity_.to_i, :price => params[:price].to_i, :total => quantity_.to_i * params[:price].to_i}
  	check_cart session["item"]
  	redirect_to :back
  end

  #function delete product to cart
  def delete_product_to_cart
  	id = params[:id]
  	if !session["cart"].nil?
  		session["cart"].each do |t|
  			if t['id'].to_i == id.to_i
  				session["cart"].delete(t)
  			end
  		end
  	end
  	redirect_to :back
  end

  #function update quantity product to cart
  def update_quantity_to_cart
  	

  	product_id_ = params[:product_id].to_i

  	session["cart"].each do |h|
  		if h['id'] == product_id_
  			h['quantity'] = params[:quantity_update].to_i
  			h['total'] = h['price'] * h['quantity']
  			
  		end
  	end

  	redirect_to :back
  end

  private
  #function check cart trong session
  def check_cart item
  	check = false
  	#Doc tat ca san pham trong cart session
  	session["cart"].each do |x|
  		#So sanh ID product voi ID product trong gio hang
  		if x['id'] == item[:id]
  			x['quantity'] = x['quantity'] + 1
  			x['total'] = x['price'] * x['quantity']
  			return
  		end
  	end
  	session["cart"].push(item)
  end
  
end
