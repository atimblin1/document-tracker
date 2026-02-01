class Collection < ApplicationRecord
  has_many :collection_items, -> { order(position: :asc) }, dependent: :destroy
  has_many :documents, through: :collection_items
  
  validates :name, presence: true, length: { minimum: 3, maximum: 100 }
  validates :description, length: { maximum: 500 }, allow_blank: true
  
  def add_document(document)
    return if documents.include?(document)
    
    next_position = collection_items.maximum(:position).to_i + 1
    collection_items.create(document: document, position: next_position)
  end
end
