ActiveAdmin.register Product do

   permit_params :name, :description, :avatar, :status
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :description]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  form html: { multipart: true }  do |f|
    f.inputs  do
      f.input :name
      f.input :description
      f.input :avatar, as: :file
      f.input :status
    end
    f.actions
  end
end
