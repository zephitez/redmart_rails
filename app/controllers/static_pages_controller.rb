class StaticPagesController < ApplicationController

def home
  @products = Product.paginate(page: params[:page], :per_page => 5)
end

end
