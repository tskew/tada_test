json.array!(@reports) do |report|
  json.extract! report, :supplier_id, :errors
  json.url report_url(report, format: :json)
end