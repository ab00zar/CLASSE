class Metadonnee
  include Mongoid::Document
  include Mongoid::Paperclip
  include Mongoid::Attributes::Dynamic
  #include Mongoid::Timestamps
  
  validates :titre, :descriptif, :organisme, :mail, :nom, :date, :thematique, presence: true
  
  
  has_many :rows, dependent: :destroy, inverse_of: :metadonnee, autosave: true
  accepts_nested_attributes_for :rows, allow_destroy: true, 
    reject_if: ->(attrs) { attrs['champ_nom'].blank? && attrs['champ_type'].blank? && attrs['champ_description'].blank?}

  has_mongoid_attached_file :file
  do_not_validate_attachment_file_type :file
  #validates_attachment :file, presence: true, size: { in: 0..40000.kilobytes }
  #validates :file, file_size: { less_than: 30.megabytes }
  field :titre, type: String
  field :descriptif, type: String
  field :date, type: String
  field :couverture, type: String
  field :nombre, type: String
  field :thematique, type: Array
  field :format, type: String
  field :autre, type: String

  field :date1, type: String
  field :date2, type: String

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

  field :champs, type: Hash

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
