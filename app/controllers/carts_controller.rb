class CartsController < ApplicationController
  def show
    user = current_user
    @cart_items = user.cart_items
  end

  def check_out
  end
end
