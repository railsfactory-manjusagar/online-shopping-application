class AddStatusToLineItem < ActiveRecord::Migration
  def change
  	  add_column :line_items, :status, :boolean, :default =>false
  end
end
