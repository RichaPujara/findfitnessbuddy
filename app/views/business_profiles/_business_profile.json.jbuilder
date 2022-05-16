json.extract! business_profile, :id, :user_id, :name, :description, :location, :created_at, :updated_at
json.url business_profile_url(business_profile, format: :json)
