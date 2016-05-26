class UsersController < ApplicationController
  def show
    user = current_user
    Thread.current[:user] = user
    @gsm = GithubServicesManager.new
  end
end
