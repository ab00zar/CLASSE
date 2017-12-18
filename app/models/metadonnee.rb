class Metadonnee
  include Mongoid::Document
  include Mongoid::Paperclip
  include Mongoid::Attributes::Dynamic
  #include Mongoid::Timestamps
  
  validates :titre, :descriptif, :date, :organisme, :mail, :nom, :file, :thematique, presence: true
  
  #embeds_many :rows
  has_many :rows, inverse_of: :metadonnee


  #accepts_nested_attributes_for :rows, allow_destroy: true

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
  field :format, type: String
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

  field :created_by, type: String

  field :champs, type: Array

  field :ndc1, type: String
  field :tdc1, type: String
  field :ddc1, type: String

  field :ndc2, type: String
  field :tdc2, type: String
  field :ddc2, type: String

  field :ndc3, type: String
  field :tdc3, type: String
  field :ddc3, type: String

  field :ndc4, type: String
  field :tdc4, type: String
  field :ddc4, type: String

  field :ndc5, type: String
  field :tdc5, type: String
  field :ddc5, type: String

end
