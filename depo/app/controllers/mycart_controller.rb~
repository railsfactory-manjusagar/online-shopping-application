class MycartController < ApplicationController
	   before_action :authenticate_user!

	def index
		@mycart=current_user.line_items.all.where("status = ?", 1)
        end

       def list
       
 	  @mycart=current_user.line_items.all.where("status = ?", 0)

          
       end
      
   
    def delete
     @line_item = LineItem.find(params[:item_id])
      @line_item.destroy
      respond_to do |format|
     format.html { redirect_to mycart_list_path,notice: 'item removed' }
    format.json { head :no_content }
     end
   end
end
