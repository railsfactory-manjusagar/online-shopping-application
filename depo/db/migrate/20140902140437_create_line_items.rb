class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items:force => true do |t|
      t.references :product, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
     execute("ALTER TABLE users AUTO_INCREMENT = 1000")

  end
end
