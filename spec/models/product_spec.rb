require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "should require one identifier" do
    def new_product_without_identifiers
      Product.new(quantity: 1, current_paying_price: 10)
    end

    it "should be valid when just a URL is given" do
      product = new_product_without_identifiers
      product.url = "http://google.com/"
      expect(product).to be_valid
    end

    it "should be valid when both a name and manufacturer are given" do
      product = new_product_without_identifiers
      product.name = "Atomizer 3000"
      product.manufacturer = "Sony"
      expect(product).to be_valid
    end

    it "should be invalid when no identifiers are given" do
      product = new_product_without_identifiers
      expect(product).to_not be_valid
    end

    it "should be invalid when just a product name is given" do
      product = new_product_without_identifiers
      product.name = "Atomizer 3000"
      expect(product).to_not be_valid
    end

    it "should be invalid when multiple types of identifiers are specified" do
      product = new_product_without_identifiers
      product.url = "http://google.com/"
      product.name = "Atomizer 3000"
      expect(product).to_not be_valid
    end

    it "should be invalid when all types of identifiers are specified" do
      product = new_product_without_identifiers
      product.url = "http://google.com/"
      product.name = "Atomizer 3000"
      product.manufacturer = "Sony"
      expect(product).to_not be_valid
    end
  end
end
