class UsersController < ApplicationController
  def show
    @gsm = GithubServicesManager.new
    # binding.pry
  end
end
