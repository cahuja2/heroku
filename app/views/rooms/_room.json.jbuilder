json.extract! room, :id, :room_name, :size, :library, :created_at, :updated_at
json.url room_url(room, format: :json)