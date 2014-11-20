json.array!(@shorties) do |shorty|
  json.extract! shorty, :id, :actual_url, :http_status, :hits, :created_at, :updated_at
  json.shortened_url BASE_URL+shorty.shortened_url
  json.alias shorty.alias ? BASE_URL+URI::escape(shorty.alias) : nil
  json.url shorty_url(shorty, format: :json)
end
