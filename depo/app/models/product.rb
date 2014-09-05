class Product < ActiveRecord::Base
	validates :title, :description, presence: true
validates :price, numericality: {greater_than_or_equal_to: 0.01}
validates :title, uniqueness: true

has_attached_file :photo
validates_attachment :photo, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

has_many :line_items

before_destroy :ensure_not_referenced_by_any_line_item
 
  def self.latest
Product.order(:updated_at).last
end

   def add_product(product_id, current_user)

        current_item = current_user.line_items.where(:status => 0).find_by(product_id: product_id)
         if current_item
          current_item.quantity += 1
         else
          current_item = current_user.line_items.build(product_id: product_id)
      end
        p current_item
      current_item
   end



 private
# ensure that there are no line items referencing this product
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
  return true
  else
    errors.add(:base, 'Line Items present')
    return false
end
end
end
