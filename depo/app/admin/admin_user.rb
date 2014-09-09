ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation
config.clear_action_items!
  filter :email
  actions :all, :except => [:destroy, :edit]
  config.batch_actions = false
  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end
   index :as => :grid do |product|
    link_to(image_tag(product.image_path), admin_product_path(product))
  end
  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
   index :download_links => false do
  end
end
