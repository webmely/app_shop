module Admin
	class OrdersController < AdminController
		def index
			@orders = Order.where(status: 'pending').order("id DESC").page(params[:page]).per(10)
			@orders1 = Order.where(status: 'success').order("id DESC").page(params[:page]).per(10)
			@orders2 = Order.where(status: 'cancel').order("id DESC").page(params[:page]).per(10)
		end

		def show
			@order = Order.find(params[:id])
		end

		def edit
			@order = Order.find(params[:id])
		end

		def update
			@order = Order.find(params[:id])
			if @order.update(order_params)
				redirect_to admin_orders_path
			else
				render 'edit'
			end
		end

		def setstatus_success
			@order = Order.find(params[:id])
			@order.status = "success"
			if @order.save
				redirect_to :back
			else
				render 'index'
			end

		end

		def setstatus_cancel
			@order = Order.find(params[:id])
			@order.status = "cancel"
			if @order.save
				redirect_to :back
			else
				render 'index'
			end
		end

		private
		def order_params
			params.require(:order).permit(:status)
		end
	end
end