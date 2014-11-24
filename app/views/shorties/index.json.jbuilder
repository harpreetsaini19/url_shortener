json.array!(@shorties) do |shorty|
  json.extract! shorty, :id, :actual_url, :http_status, :created_at, :updated_at, :bookmark
  json.shortened_url @base_url+shorty.shortened_url
  json.alias shorty.alias ? @base_url+URI::escape(shorty.alias) : nil
  json.hits shorty.hits.count
  json.url shorty_url(shorty, format: :json)
end
