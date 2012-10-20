class AddProductPriceToLineItem < ActiveRecord::Migration
  def up
    add_column :line_items, :price, :decimal
    LineItem.all.each do |item|
      item.price = item.product.price
    end
  end

  def down
    remove_column :line_items, :price
  end
end
