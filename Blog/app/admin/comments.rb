ActiveAdmin.register Comment do

  permit_params :commenter, :comment, :article_id, :status
 
end
