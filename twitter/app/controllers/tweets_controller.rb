class TweetsController < ApplicationController
    
  before_action :set_user, only: :index
  
    def create
        @tweet = current_user.tweets.build(tweet_params)
        if @tweet.save
          json_response(@tweet, :created)
        else
          json_response({ success: false, message: "Error while creating tweet", errors: @tweet.errors }, :unprocessable_entity)
        end
      end

      # method to get a list of tweets

  def index
    @following_user_ids = @user.following.pluck(:id)
    @tweets = Tweet.where(user_id: @following_user_ids).order(created_at: :desc).includes(:user)

    json_response(@tweets)
  end
  
   private
      
      def tweet_params
        params.require(:tweet).permit(:content)
      end

      def set_user
        @user = User.find(params[:user_id])
      end
end
