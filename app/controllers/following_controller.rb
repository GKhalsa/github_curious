class FollowingController < ApplicationController

  def index
    Thread.current[:user] = current_user
    @following = Following.all
  end

end
