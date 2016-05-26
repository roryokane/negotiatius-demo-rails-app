module ApplicationHelper
  def nav_cart_link_text
    cart_items = current_user.cart_items
    if cart_items.any?
      "Cart (#{cart_items.size})"
    else
      'Cart'
    end
  end
end
