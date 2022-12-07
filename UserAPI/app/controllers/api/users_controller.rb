class Api::UsersController < ApplicationController

    protect_from_forgery with: :null_session
    before_action :set_user, only: [:show, :update, :destroy]
        def index
            @list = User.all
            render json:  @list 
       end
       
       def show
        render json: @user
       end

       def create
        @user = User.new(user_params)
    
        if @user.save
          render json: @user, status: :created
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end
       
 
    #   # PATCH/PUT /posts/1
      def update    
        if @user.update(user_params)
          render json: @user
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end
    
      # DELETE /posts/1
      def destroy
        @user.destroy
      end

       private
       # Use callbacks to share common setup or constraints between actions.
       def set_user
         @user = User.find(params[:id])
         return render json: {message: "record not found" } unless @user.present?
       end
   
       # Only allow a trusted parameter "white list" through.
       def user_params
         params.require(:user).permit(:first_name, :last_name , :email)
       end

end
