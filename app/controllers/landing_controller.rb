class LandingController < ApplicationController

  def index; end

  def describe; end

  def showcase; end

  def neighbors
  	@users = User.limit(8)
  	@friends = current_user.friends
  end

  def help; end

end
