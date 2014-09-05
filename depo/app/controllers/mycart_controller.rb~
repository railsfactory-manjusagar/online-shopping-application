class MycartController < ApplicationController
	   before_action :authenticate_user!

	def index
		@mycart=current_user.line_items.all.where("status = ?", 1)
end

  def list
 	@mycart=current_user.line_items.all.where("status = ?", 0)
  end


end
