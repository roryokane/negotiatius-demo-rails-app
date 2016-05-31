class CartItemsController < ApplicationController
  before_action :authenticate_user!

  def create
    begin
      product = Product.owned_by_user(current_user).find(product_param_id)
    rescue ActiveRecord::RecordNotFound
      flash[:error] = 'Error: no such product.'
      redirect_to products_path
      return
    end

    cart_item = CartItem.new(cart_item_params.merge({product: product}))
    if cart_item.save
      redirect_to cart_path, notice: 'Product added to cart.'
    else
      flash[:error] = 'Error: invalid quantity.'
      redirect_to products_path
    end
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:quantity)
  end

  def product_param_id
    params.require(:product)[:id]
  end
end
