class CartsController < ApplicationController

  def show

      @cart = Cart.find_by user_id: current_user.id

      # flash[:warning] = "Please log in to have your cart!"

  end

  def create
    @cart = Cart.products.create!()

    flash[:success] = "Product Added to Cart Successfully"
  end

end
