class UsersController < ApplicationController

    before_action :set_user, only: :show

    # method to get other user profile
  def show
    json_response(@user)
  end
  def profile
    json_response(current_user)
  end

  private
  
  def set_user
    @user = User.find(params[:id])
  end
    # method to get current user profile
  
end
