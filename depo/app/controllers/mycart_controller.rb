class MycartController < ApplicationController
	   before_action :authenticate_user!

	def index
		@mycart=current_user.line_items.all.where("status = ?", 1)
        end

       def list
 	         @mycart=current_user.line_items.all.where("status = ?", 0)
              respond_to do |format|
            if @mycart.empty?
              format.html { redirect_to store_url, notice: 'your current cart is empty.' }
             
            else
               format.html { render :list }
               format.json { head :no_content }
            end
         end
      end
   
    def delete
     @line_item = LineItem.find(params[:item_id])
        if @line_item.quantity > 1
         @quantity = @line_item.quantity - 1
       
         
           @line_item.update_attribute("quantity","#{@quantity}")
            #@order.update_attribute("totalprice", "#{@totalpri}")
           respond_to do |format|
         format.html { redirect_to mycart_list_path,notice: 'item removed' }
         format.json { head :no_content }
  end
       else
      @line_item.destroy
      respond_to do |format|
     format.html { redirect_to mycart_list_path,notice: 'item removed' }
    format.json { head :no_content }
     end
      end
   end
end
