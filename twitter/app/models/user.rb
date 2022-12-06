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

	# relationship for following
	has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
	has_many :following, through: :active_relationships, source: :followed

	# relationship for followers
	has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
	has_many :followers, through: :passive_relationships, source: :follower

	
	# relationship for tweets
	has_many :tweets, dependent: :destroy

	# follow a user
	def follow!(tw_user)
		# following << tw_user
		active_relationships.create(followed_id: tw_user.id)
	end

	# unfollow a user
	def unfollow!(tw_user)
		# following.delete(tw_user)
		active_relationships.find_by(followed_id: tw_user.id).destroy
	end

	# if current user is following other user, it will return true
	def following?(tw_user)
		following.include?(tw_user)
	end

	def as_json(options = {})
		super(options.merge({ except: [:auth_token, :created_at, :updated_at] }))
	end
end
