class CartItemsController < ApplicationController
  def new
    @product = Product.new
    @cart_item = CartItem.new
  end

  def create
    @product = Product.new(product_params.merge({user: current_user}))
    @cart_item = CartItem.new(cart_item_params.merge({product: @product}))

    if @product.valid? && @cart_item.valid? && @product.save && @cart_item.save
      redirect_to cart_path, notice: 'Product added to cart.'
    else
      render :new
    end
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:quantity)
  end

  def product_params
    params.require(:product).permit(:url, :name, :manufacturer, :description, :current_paying_price)
  end
end
