class StaticPagesController < ApplicationController
  def home
    if logged_in?
  @review  = current_user.reviews.build
  @feed_items = current_user.feed.paginate(page: params[:page], :per_page => 15)
end
  end

end
