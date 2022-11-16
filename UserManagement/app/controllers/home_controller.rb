class HomeController < ApplicationController
  def index
  end

  def about
    @user_lists = UserList.all
  end
end
