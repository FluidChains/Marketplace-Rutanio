json.extract! request, :id, :mensaje, :contacto_mail, :user_id, :service_id, :created_at, :updated_at
json.url request_url(request, format: :json)
