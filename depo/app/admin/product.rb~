ActiveAdmin.register Product do
config.batch_actions = false
  
permit_params :list, :of, :attributes, :on, :model, :title, :description, :photo, :price

 index do
    selectable_column
    
    column :title
    column :description
    product = Product.all
    column "Image",:photo do|product| 
      image_tag product.photo, class: 'my_image_size'
   end
    
    column :price, :sortable => :price do |product|
     number_to_currency product.price
    end
    actions
  end



  form :html => { :enctype => "multipart/form-data" } do |f| 
    f.inputs "Product", :multipart => true do 
      f.input :title 
      f.input :description 
      f.input :photo
      f.input :price 
   end 
    f.actions
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
 index :download_links => false do
       index :download_links => false
  end

end
