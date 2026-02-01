class Document < ApplicationRecord
  STATUSES = %w[draft reviewed finalized].freeze
  DOC_TYPES = %w[contract invoice receipt report other].freeze
  
  has_one_attached :file
  
  has_many :document_tags, dependent: :destroy
  has_many :tags, through: :document_tags
  
  has_many :collection_items, dependent: :destroy
  has_many :collections, through: :collection_items
  
  validates :title, presence: true, length: { minimum: 3, maximum: 200 }
  validates :description, length: { maximum: 1000 }, allow_blank: true
  validates :doc_type, presence: true, inclusion: { in: DOC_TYPES }
  validates :status, presence: true, inclusion: { in: STATUSES }
  validate :file_validation
  
  scope :by_status, ->(status) { where(status: status) if status.present? }
  scope :by_type, ->(doc_type) { where(doc_type: doc_type) if doc_type.present? }
  scope :by_tag, ->(tag_id) { joins(:tags).where(tags: { id: tag_id }) if tag_id.present? }
  scope :search, ->(query) { where('title ILIKE ?', "%#{query}%") if query.present? }
  
  def tag_names
    tags.pluck(:name).join(', ')
  end
  
  private
  
  def file_validation
    if file.attached?
      unless file.content_type == 'application/pdf'
        errors.add(:file, 'must be a PDF')
      end
      
      if file.byte_size > 10.megabytes
        errors.add(:file, 'must be less than 10MB')
      end
    else
      errors.add(:file, 'must be attached')
    end
  end
end
