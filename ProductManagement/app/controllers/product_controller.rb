class ProductController < ApplicationController
    def index
        @products = Product.select("name, description, avatar").all
        return @products
    end
end
