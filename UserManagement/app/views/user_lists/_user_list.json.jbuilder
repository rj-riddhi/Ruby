json.extract! user_list, :id, :first_name, :last_name, :email, :phone, :insta_id, :created_at, :updated_at
json.url user_list_url(user_list, format: :json)
