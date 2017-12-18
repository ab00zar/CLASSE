class Row
  include Mongoid::Document
  field :champ_nom, type: String
  field :champ_type, type: String
  field :champ_description, type: String
  belongs_to :metadonnee
end
