class ProductsController < ApplicationController
  require 'pry'
  before_action :find_product, except: [:create, :index]

  def create
    @product = Product.create(product_params)
    redirect_to products_path
  end

  def index
    @products = Product.all
  end

  def inventory
    render plain: @product.inventory > 0 ? true : false
  end

  def description
    render plain: @product.description
  end

  private

  def find_product
    @product = Product.find_by_id(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :inventory, :description)
  end

end
