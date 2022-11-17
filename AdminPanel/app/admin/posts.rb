ActiveAdmin.register Post do

  permit_params :title, :body, :user_id
  
end
