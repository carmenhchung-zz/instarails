json.extract! photo, :id, :image_data, :user_id, :caption, :created_at, :updated_at
json.url photo_url(photo, format: :json)
