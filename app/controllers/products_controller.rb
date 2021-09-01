class ProductsController < ApplicationController
  before_action :authenticate_user!

  def index
    @products = Product.all
  end
  
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params.require(:product).permit(:product_name, :product_price))
    if @product.save
      redirect_to products_path
    else
      render new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def destroy
    @product =Product.find(params[:id])
    if @product.destroy
      redirect_to products_path

    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(params.require(:product).permit(:product_name, :product_price))
      redirect_to products_path
    end
  end
end
