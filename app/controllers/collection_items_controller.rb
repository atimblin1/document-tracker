class CollectionItemsController < ApplicationController
  before_action :ensure_not_demo_mode!
  before_action :set_collection
  before_action :set_collection_item, only: [:destroy, :move_up, :move_down]
  
  def create
    document = Document.find(params[:document_id])
    @collection.add_document(document)
    
    redirect_to @collection, notice: 'Document added to collection.'
  end

  def destroy
    @collection_item.destroy
    redirect_to @collection, notice: 'Document removed from collection.'
  end

  def move_up
    @collection_item.move_up
    redirect_to @collection
  end

  def move_down
    @collection_item.move_down
    redirect_to @collection
  end
  
  private
  
  def set_collection
    @collection = Collection.find(params[:collection_id])
  end
  
  def set_collection_item
    @collection_item = @collection.collection_items.find(params[:id])
  end
end
