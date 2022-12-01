ActiveAdmin.register Purchase do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  after_build do
    Purchases.class_eval do
      def to_param
        id.to_s
      end
    end
  end
  permit_params :email, :amount, :description, :currency, :customer_id, :card, :product_id, :uuid
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :amount, :description, :currency, :customer_id, :card, :product_id, :uuid]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
