json.extract! ride, :id, :user_id, :departure, :arrival, :reservation, :min, :max, :memo, :via, :samesex, :created_at, :updated_at
json.url ride_url(ride, format: :json)
