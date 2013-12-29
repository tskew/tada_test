json.array!(@data) do |datum|
  json.extract! datum, :name, :phone, :supplier_id
  json.url datum_url(datum, format: :json)
end