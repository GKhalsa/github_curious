class DataController < ApplicationController
  def index
    Thread.current[:user] = current_user
    @data = SearchManager.new
  end
end
