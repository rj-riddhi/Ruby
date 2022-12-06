class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         # Authorization token for api sessions
	  before_create :generate_auth_token!

	  # Function used to generate token for api authentication
	  def generate_auth_token!
	    begin
	      self.auth_token = Devise.friendly_token
	    end while self.class.exists?(auth_token: auth_token)
	  end
end
