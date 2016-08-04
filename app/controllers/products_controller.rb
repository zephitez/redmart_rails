class ProductsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def index
    @products = Product.paginate(page: params[:page], :per_page => 5)
  end
  def show
    @product = Product.find(params[:id])
    @review = @product.reviews.build
    @feed_items = @product.reviews.paginate(page: params[:page], :per_page => 10)
    @cart = Cart.products.build
  end

  def destroy
    Product.find(params[:id]).destroy
    flash[:success] = "Product deleted"
    redirect_to products_url
  end

def new
  @product = Product.new
end

def create
  @product = Product.new(product_params)
  if @product.save
    flash[:success] = 'Product successfully added!'
    redirect_to @product
  else
    redirect_to :back
  end
end

def edit
  @product = Product.find(params[:id])
  end

def update
  @product = Product.find(params[:id])
  if @product.update_attributes(product_params)
    flash[:success] = "Product updated Successfully"
    redirect_to @product
  else
    redirect_to :back
  end
  end

private

def product_params
  params.require(:product).permit(:picture, :name, :price, :description)
end

end
