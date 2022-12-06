class Users::RegistrationsController < Devise::RegistrationsController
	skip_before_action :authenticate_with_token!, only: :create

	# POST /resource
	  def create
	    @user = User.new(user_params)
	    if @user.save
	      json_response({ success: true, message: "Registration successful.", user: @user }, :created)
	    else
	      json_response({ success: false, message: "Error in registration", errors: @user.errors }, :unprocessable_entity)
	    end
	  end

	# DELETE /resource
	  def destroy
		puts "called"
	  end  

	  private

	  def user_params
	    params.require(:user).permit(:email, :password)
	  end
	  
end