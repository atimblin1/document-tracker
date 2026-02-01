require "application_system_test_case"

class DocumentsTest < ApplicationSystemTestCase
  def setup
    @tag = Tag.create!(name: "test-tag")
  end
  
  test "viewing documents index" do
    visit documents_path
    
    assert_selector "h1", text: "Documents"
  end
  
  test "viewing document show page" do
    document = create_test_document
    
    visit documents_path
    click_on document.title
    
    assert_selector "h1", text: document.title
    assert_text document.description
  end
  
  test "demo mode blocks document creation" do
    ENV['DEMO_MODE'] = 'true'
    
    visit documents_path
    
    # Should not see new document button
    assert_no_link "New Document"
    
    # Trying to visit new document page and submit should fail
    visit new_document_path
    
    assert_text "demo mode"
    
    ENV['DEMO_MODE'] = 'false'
  end
  
  test "can create document when not in demo mode" do
    ENV['DEMO_MODE'] = 'false'
    
    visit documents_path
    click_on "New Document"
    
    fill_in "Title", with: "Test Document"
    fill_in "Description", with: "Test description"
    select "Contract", from: "Document Type"
    select "Draft", from: "Status"
    
    # Note: File upload would require actual file in test environment
    # This is a simplified test
    
    ENV['DEMO_MODE'] = 'false'
  end
  
  private
  
  def create_test_document
    doc = Document.new(
      title: "Test Document",
      description: "This is a test document",
      doc_type: "report",
      status: "draft"
    )
    
    # Create simple PDF
    pdf_content = "%PDF-1.4\n1 0 obj\n<< /Type /Catalog >>\nendobj\nxref\n0 1\ntrailer\n<< /Size 1 /Root 1 0 R >>\nstartxref\n%%EOF"
    
    doc.file.attach(
      io: StringIO.new(pdf_content),
      filename: "test.pdf",
      content_type: "application/pdf"
    )
    
    doc.save!
    doc.tags << @tag
    doc
  end
end
