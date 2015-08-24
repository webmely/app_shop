class OrdersController < ApplicationController


  def index
  end

  def show
    @order = Order.where(user_id: current_user.id).order("id DESC").page(params[:page]).per(10)
  end

  def new
    
  end

  def success

  end
  
  #function checkout
  def create

  	@order = Order.new(order_params)
  	@order.user_id = current_user.id
  	@order.status = "pending"
  	#od = params[:order]
  	#dt = od['reciverdate']
  	
  	#formatted_date = dt.Date.strptime("12/13/2013", "%m/%d/%Y")
  	#@order.reciverdate = formatted_date

  	if @order.save
  		#insert order details
  		
  		session["cart"].each do |h|
        #create orderdetails
  			@orderdetail = Orderdetail.new
  			@orderdetail.order_id = Order.maximum("id")
  			@orderdetail.productname = h['name']
  			@orderdetail.quantity = h['quantity']
        @orderdetail.price = h['price']
        @orderdetail.price_total = h['total']
  			@orderdetail.save
  		end
  		session["cart"] = []
  		render 'success'

  	else
  		render 'index'
  	end

  end

  private

  def order_params
  	params.require(:order).permit(:reciverdate, :reciveraddress, :email, :total, :phone)
  end
end
