class Metadonnee
  include Mongoid::Document
  include Mongoid::Paperclip

  has_mongoid_attached_file :shape_file
  do_not_validate_attachment_file_type :shape_file

  has_mongoid_attached_file :excel_file
  do_not_validate_attachment_file_type :excel_file

  has_mongoid_attached_file :texte_file
  do_not_validate_attachment_file_type :texte_file

  has_mongoid_attached_file :access_file
  do_not_validate_attachment_file_type :access_file

  has_mongoid_attached_file :autre_file
  do_not_validate_attachment_file_type :autre_file

  has_mongoid_attached_file :file
  do_not_validate_attachment_file_type :file


  field :titre, type: String
  field :descriptif, type: String
  field :date, type: String
  field :couverture, type: String
  field :nombre, type: String
  field :thematique, type: Array
  field :format, type: Array
  field :autre, type: String

  field :file

  field :geocode, type: String
  field :projection, type: String
  field :type, type: String

  field :organisme, type: String
  field :mail, type: String
  field :periodicite, type: String
  field :nom, type: String
  field :tel, type: String
  field :acces, type: String

  field :champs, type: Array
  field :noms, type: String
end
