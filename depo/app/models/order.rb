class Order < ActiveRecord::Base
	has_many :line_items
	 PAYMENT_TYPES = [ "Check", "Credit card", "Purchase order" ]
end
