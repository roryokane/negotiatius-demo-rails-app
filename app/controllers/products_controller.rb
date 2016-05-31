class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  def index
    @products = Product.where(user: current_user).shown_in_inventory
  end

  # GET /products/1
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
    @cart_item = CartItem.new
    @cart_item.quantity = 1
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  def create
    @product = Product.new(product_params.merge({user: current_user}))
    @cart_item = CartItem.new(cart_item_params.merge({product: @product}))

    if @product.valid? && @cart_item.valid? && @product.save && @cart_item.save
      redirect_to cart_path, notice: 'Product added to cart.'
    else
      render :new
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
    redirect_to products_url, notice: 'Product was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:url, :name, :manufacturer, :description, :quantity, :current_paying_price)
    end
end
