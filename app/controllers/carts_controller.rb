class CartsController < ApplicationController

  def show

      @cart = Cart.find_by user_id: current_user.id

      # flash[:warning] = "Please log in to have your cart!"

  end

  def create
    # create cart upon add to cart
    @added_product = Product.find( params[:product_id] )

    @added_cart = @added_product.carts.create(
      user_id: current_user.id
    )

    if @added_cart.save
      flash[:success] = "Product Added to Cart Successfully"
      redirect_to :back
    end
  end

end
