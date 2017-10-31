class StaticPagesController < ApplicationController
  def home
  	if logged_in?

  	@micropost=current_customer.microposts.build
  	@feed_items=current_customer.feed.paginate(page: params[:page])
  end
end

  def help
  end
  
  def about
  end
end
