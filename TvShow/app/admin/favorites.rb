ActiveAdmin.register Favorite do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :favoritable_type, :favoritable_id, :favoritor_type, :favoritor_id, :scope, :blocked
  #
  # or
  #
  # permit_params do
  #   permitted = [:favoritable_type, :favoritable_id, :favoritor_type, :favoritor_id, :scope, :blocked]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
