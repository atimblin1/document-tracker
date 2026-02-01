class CollectionItem < ApplicationRecord
  belongs_to :collection
  belongs_to :document
  
  validates :document_id, uniqueness: { scope: :collection_id }
  validates :position, presence: true
  
  def move_up
    return if position <= 0
    
    swap_with = collection.collection_items.find_by(position: position - 1)
    if swap_with
      swap_with.update(position: position)
      update(position: position - 1)
    end
  end
  
  def move_down
    swap_with = collection.collection_items.find_by(position: position + 1)
    if swap_with
      swap_with.update(position: position)
      update(position: position + 1)
    end
  end
end
