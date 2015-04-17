class HomeController < ApplicationController
  require 'resque'
  def index
    @users = User.all
    @searchresult = Book.all
  end

  def edit

  end
end
