ActiveAdmin.register Page do

  permit_params :title, :slug, :description
 
    form title: 'Edit Page' do |f|
      inputs 'Details' do
        input :title
        input :slug
        input :description, as: :ckeditor
      end
        actions
    end
  
end
