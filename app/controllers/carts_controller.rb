class CartsController < ApplicationController

  def show

      @cart = Cart.find_by user_id: current_user.id

      # flash[:warning] = "Please log in to have your cart!"

  end

  def create
    @current_user_cart = Cart.find_by user_id: current_user.id

    @current_user_cart.products.create(
      quantity: 1
    );


    if @current_user_cart.products.save
    flash[:success] = "Product Added to Cart Successfully"
    end
  end

end
