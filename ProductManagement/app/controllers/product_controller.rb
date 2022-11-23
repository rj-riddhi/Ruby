class ProductController < ApplicationController
    layout 'details', only: [:show]
    def index
        @products = Product.select("name, description, avatar, id, status").all
        return @products
    end

    def show
        @product = Product.find(params[:id])
        render :details
    end
end
