class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :user
  belongs_to :order
  
    def totalprice(current_user)
    	  
    	   @totalprice = 0
    	    line_items = LineItem.all 

    	  current_user.line_items.where(:status => 0).each do |m|
    	 @totalprice += m.product.price * m.quantity

    	
           end

           @totalprice
     end
 
end
