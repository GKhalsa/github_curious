class FollowersController < ApplicationController

  def index
    Thread.current[:user] = current_user
    @followers = Follower.all
  end

end
