class PurchasesController < ApplicationController
    def show
        @purchase = Purchase.find_by_uuid(params[:id])
    end
    def index
        @purchase = Purchase.find_by_uuid(params[:id])
    end
end