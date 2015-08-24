class ProductsController < ApplicationController
  def index
  	@products = Product.order("id DESC").page(params[:page]).per(9)
  end

  def show
  	@product = Product.find(params[:id])
  end

  #function search by name
  def search
  	@search = Product.search(params[:q]).page(params[:page]).per(12).order("created_at DESC")
    
  end

end
