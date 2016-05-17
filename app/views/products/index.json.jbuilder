json.array!(@products) do |product|
  json.extract! product, :id, :url, :name, :manufacturer, :description, :quantity, :current_paying_price
  json.url product_url(product, format: :json)
end
