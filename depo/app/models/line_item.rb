class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :user
  belongs_to :order
   def total_price
    line_item.to_a.sum { |item| item.total_price }
end


 
end
