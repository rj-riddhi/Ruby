class UserListsController < ApplicationController
  before_action :set_user_list, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  # GET /user_lists or /user_lists.json
  def index
    @user_lists = UserList.all
  end

  # GET /user_lists/1 or /user_lists/1.json
  def show
  end

  # GET /user_lists/new
  def new
    @user_list = UserList.new
  end

  # GET /user_lists/1/edit
  def edit
  end

  # POST /user_lists or /user_lists.json
  def create
    @user_list = UserList.new(user_list_params)

    respond_to do |format|
      if @user_list.save
        format.html { redirect_to user_list_url(@user_list), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user_list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_lists/1 or /user_lists/1.json
  def update
    respond_to do |format|
      if @user_list.update(user_list_params)
        format.html { redirect_to user_list_url(@user_list), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_lists/1 or /user_lists/1.json
  def destroy
    @user_list.destroy

    respond_to do |format|
      format.html { redirect_to user_lists_url, notice: "User  was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @friend = current_user.user_lists.find_by(id: params[:id])
    redirect_to user_list_path, notice: "Not Autherized to edit this user" if @friend.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_list
      @user_list = UserList.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_list_params
      params.require(:user_list).permit(:first_name, :last_name, :email, :phone, :insta_id, :user_id)
    end
end
