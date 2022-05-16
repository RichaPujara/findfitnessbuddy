json.extract! address, :id, :profile_id, :street, :suburb, :city, :state, :country, :postcode, :created_at, :updated_at
json.url address_url(address, format: :json)
