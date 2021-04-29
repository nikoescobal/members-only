json.extract! secret, :id, :title, :body, :created_at, :updated_at
json.url secret_url(secret, format: :json)
