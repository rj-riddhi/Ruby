ActiveAdmin.register Product do

  permit_params :name, :description, :condition, :price, :image
  
  
end
