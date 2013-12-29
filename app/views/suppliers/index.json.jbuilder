json.array!(@suppliers) do |supplier|
  json.extract! supplier, :name, :email, :phone
  json.url supplier_url(supplier, format: :json)
end