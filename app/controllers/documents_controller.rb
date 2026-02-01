class DocumentsController < ApplicationController
  before_action :ensure_not_demo_mode!, only: [:create, :update, :destroy]
  before_action :set_document, only: [:show, :edit, :update, :destroy]
  
  def index
    @documents = Document.includes(:tags)
                        .search(params[:search])
                        .by_status(params[:status])
                        .by_type(params[:doc_type])
                        .by_tag(params[:tag_id])
                        .order(created_at: :desc)
    
    @tags = Tag.order(:name)
  end

  def show
  end

  def new
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)
    
    if @document.save
      redirect_to @document, notice: 'Document was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @document.update(document_params)
      redirect_to @document, notice: 'Document was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @document.destroy
    redirect_to documents_url, notice: 'Document was successfully deleted.'
  end
  
  private
  
  def set_document
    @document = Document.find(params[:id])
  end
  
  def document_params
    params.require(:document).permit(:title, :description, :doc_type, :status, :file)
  end
end
