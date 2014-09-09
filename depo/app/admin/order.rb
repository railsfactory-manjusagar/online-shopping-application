ActiveAdmin.register Order do

   config.clear_action_items!
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
     show do |order|
    div do      
      panel("Items") do
        table_for(order.line_items) do
          column "Title" do |i| 
            i.product.title
          end

          column "email" do |i| 
            i.user.email
          end
          column :quantity
            @total = []
            @price = 0
          column "price" do |i|
          @total <<  i.product.price * i.quantity
              number_to_currency(i.product.price * i.quantity)
          end
         @price = @total.sum

         end
        end
        table_for order do
         column :totalprice do 
         number_to_currency(@price)
      end
    end
      end

  end
      

   filter :name

   index do
      column :name
      column :address
      column :pay_type
      column :created_at
    end
 index :download_links => false do
     index :download_links => false
  end
end
