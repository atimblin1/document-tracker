require "application_system_test_case"

class CollectionsTest < ApplicationSystemTestCase
  def setup
    @document = create_test_document
  end
  
  test "viewing collections index" do
    visit collections_path
    
    assert_selector "h1", text: "Collections"
  end
  
  test "demo mode blocks collection mutations" do
    ENV['DEMO_MODE'] = 'true'
    
    collection = Collection.create!(name: "Test Collection", description: "Test")
    
    visit collections_path
    
    # Should not see new collection button
    assert_no_link "New Collection"
    
    # Visit collection show page
    click_on "Test Collection"
    
    # Should not see add document form
    assert_no_button "Add to Collection"
    
    ENV['DEMO_MODE'] = 'false'
  end
  
  test "can create collection and add documents when not in demo mode" do
    ENV['DEMO_MODE'] = 'false'
    
    visit collections_path
    click_on "Create Collection"
    
    fill_in "Name", with: "My Test Collection"
    fill_in "Description", with: "Collection for testing"
    click_button "Create Collection"
    
    assert_text "Collection was successfully created"
    assert_text "My Test Collection"
    
    # Add document to collection
    select @document.title, from: "collection_item_document_id"
    click_button "Add to Collection"
    
    assert_text "Document added to collection"
    assert_text @document.title
    
    ENV['DEMO_MODE'] = 'false'
  end
  
  private
  
  def create_test_document
    doc = Document.new(
      title: "Test Document for Collection",
      description: "This is a test",
      doc_type: "report",
      status: "draft"
    )
    
    pdf_content = "%PDF-1.4\n1 0 obj\n<< /Type /Catalog >>\nendobj\nxref\n0 1\ntrailer\n<< /Size 1 /Root 1 0 R >>\nstartxref\n%%EOF"
    
    doc.file.attach(
      io: StringIO.new(pdf_content),
      filename: "test.pdf",
      content_type: "application/pdf"
    )
    
    doc.save!
    doc
  end
end
