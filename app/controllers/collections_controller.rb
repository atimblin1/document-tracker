class CollectionsController < ApplicationController
  before_action :ensure_not_demo_mode!, only: [:create, :update, :destroy]
  before_action :set_collection, only: [:show, :edit, :update, :destroy]
  
  def index
    @collections = Collection.order(created_at: :desc)
  end

  def show
    @available_documents = Document.where.not(id: @collection.documents.pluck(:id)).order(:title)
  end

  def new
    @collection = Collection.new
  end

  def create
    @collection = Collection.new(collection_params)
    
    if @collection.save
      redirect_to @collection, notice: 'Collection was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @collection.update(collection_params)
      redirect_to @collection, notice: 'Collection was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @collection.destroy
    redirect_to collections_url, notice: 'Collection was successfully deleted.'
  end
  
  private
  
  def set_collection
    @collection = Collection.find(params[:id])
  end
  
  def collection_params
    params.require(:collection).permit(:name, :description)
  end
end
