json.extract! booking, :id, :status, :title, :description, :start_at, :end_at, :room_id, :customer_id, :created_at, :updated_at
json.url booking_url(booking, format: :json)
