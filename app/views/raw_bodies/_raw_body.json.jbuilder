json.extract! raw_body, :id, :body, :title, :company_name, :company_des, :created_at, :updated_at
json.url raw_body_url(raw_body, format: :json)
