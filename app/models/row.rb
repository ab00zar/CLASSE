class Row
  include Mongoid::Document

  belongs_to :metadonnee
  
  field :champ_nom, type: String
  field :champ_type, type: String
  field :champ_description, type: String
  
end
