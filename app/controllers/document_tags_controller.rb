class DocumentTagsController < ApplicationController
  before_action :ensure_not_demo_mode!
  before_action :set_document
  
  def create
    tag_name = params[:tag_name]&.strip&.downcase
    
    if tag_name.present?
      tag = Tag.find_or_create_by(name: tag_name)
      @document.tags << tag unless @document.tags.include?(tag)
    end
    
    redirect_to @document, notice: 'Tag added.'
  end

  def destroy
    tag = Tag.find(params[:id])
    @document.tags.delete(tag)
    
    redirect_to @document, notice: 'Tag removed.'
  end
  
  private
  
  def set_document
    @document = Document.find(params[:document_id])
  end
end
