class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    user = current_user
    @cart_items = user.cart_items
  end

  def check_out
  end
end
