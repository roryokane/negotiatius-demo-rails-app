class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    user = current_user
    @cart_items = user.cart_items
  end

  def check_out
    cart_items = current_user.cart_items
    cart_items.includes(:product).each do |cart_item|
      order_cart_item(cart_item)
    end
    flash[:notice] = "Order placed. (Not really, but let’s pretend.)"
    redirect_to cart_path
  end

  private

  def order_cart_item(cart_item)
    product = cart_item.product
    product.total_amount_ordered += cart_item.quantity
    product.save
    cart_item.destroy
  end
end
