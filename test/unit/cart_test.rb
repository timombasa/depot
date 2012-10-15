require 'test_helper'

class CartTest < ActiveSupport::TestCase
  fixtures :products

  test "add unique products" do
    cart = Cart.create
    coffeescript_Book = products(:coffeescript)
    rails_Book = products(:railstest)

    cart.add_product(rails_Book.id).save!
    cart.add_product(coffeescript_Book.id).save!

    assert_equal 2, cart.line_items.size
    assert_equal coffeescript_Book.price + rails_Book.price, cart.total_price
  end

  test "add duplicate products" do
    cart = Cart.create
    ruby = products(:ruby)

    cart.add_product(ruby.id).save!
    cart.add_product(ruby.id).save!
  end

end
