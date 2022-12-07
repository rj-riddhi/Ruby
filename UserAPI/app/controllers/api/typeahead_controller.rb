class Api::TypeaheadController < ApplicationController
  def show
      if params[:input]
          @list = User.custom(params[:input])
          render json:  @list , message: "list of match" 
      end
  end
end
