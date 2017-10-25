class Ship
  include Mongoid::Document
  field :_id, type: Integer
  field :name, type: String
  field :teu, type: Integer
  field :built, type: String
  field :deadweight, type: Integer
  field :draught, type: Float
  field :length, type: Float
  field :flag, type: String
  field :operator, type: String
  field :registered_owner, type: String
  field :shipmanager, type: String
  field :operator_url, type: String
  field :operator_list_url, type: String
  field :owner_url, type: String
  field :owner_list_url, type: String
  field :shipmanager_url, type: String
  field :shipmanager_list_url, type: String
  field :category, type: String
end
