class HistoryController < ApplicationController

   def index 
     @line_items = current_user.line_items.all
   end
end
