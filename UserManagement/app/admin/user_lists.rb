ActiveAdmin.register UserList do

  permit_params :first_name, :last_name, :email, :phone, :insta_id, :user_id
  
end
