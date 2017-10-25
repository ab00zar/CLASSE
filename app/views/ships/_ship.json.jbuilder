json.extract! ship, :id, :name, :teu, :built, :deadweight, :draught, :length, :flag, :operator, :registered_owner, :shipmanager, :operator_url, :operator_list_url, :owner_url, :owner_list_url, :shipmanager_url, :shipmanager_list_url, :category, :created_at, :updated_at
json.url ship_url(ship, format: :json)
