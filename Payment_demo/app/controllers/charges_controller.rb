class ChargesController < ApplicationController

    def new
    end
    
    def create
      # Amount in cents
    
      customer = Stripe::Customer.create(
        :email => params[:stripeEmail],
        :source => params[:stripeToken],
      )
    
      charge = Stripe::PaymentIntent.create(
        :customer => customer.id,
        :amount => params[:amount],
        :description => 'Rails Stripe customer',
        :currency => 'INR',
      )

      purchase = Purchase.create(email: params[:stripeEmail], card: params[:stripeToken], amount: params[:amount], description: charge.description, currency: charge.currency, customer_id: customer.id, product_id: 1, uuid: SecureRandom.uuid)
    #   UserMailer.with(user: params[:stripeEmail]).welcome_email.deliver_later
      redirect_to purchase
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end

end
