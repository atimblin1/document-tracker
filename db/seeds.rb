# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Clean up existing data in development
if Rails.env.development?
  puts "Cleaning up existing data..."
  CollectionItem.destroy_all
  DocumentTag.destroy_all
  Document.destroy_all
  Tag.destroy_all
  Collection.destroy_all
end

puts "Creating sample documents..."

# Create tags
tags = ['financial', 'legal', 'personal', 'business', 'tax'].map do |tag_name|
  Tag.find_or_create_by!(name: tag_name)
end

# Create sample PDF content (simple text-based PDF)
require 'stringio'

def create_sample_pdf(title)
  # Create a simple PDF with text content
  pdf_content = "%PDF-1.4
1 0 obj
<< /Type /Catalog /Pages 2 0 R >>
endobj
2 0 obj
<< /Type /Pages /Kids [3 0 R] /Count 1 >>
endobj
3 0 obj
<< /Type /Page /Parent 2 0 R /Resources 4 0 R /MediaBox [0 0 612 792] /Contents 5 0 R >>
endobj
4 0 obj
<< /Font << /F1 << /Type /Font /Subtype /Type1 /BaseFont /Helvetica >> >> >>
endobj
5 0 obj
<< /Length 80 >>
stream
BT
/F1 12 Tf
100 700 Td
(#{title}) Tj
ET
endstream
endobj
xref
0 6
0000000000 65535 f 
0000000009 00000 n 
0000000058 00000 n 
0000000115 00000 n 
0000000214 00000 n 
0000000304 00000 n 
trailer
<< /Size 6 /Root 1 0 R >>
startxref
434
%%EOF"
  
  StringIO.new(pdf_content)
end

# Create documents
documents_data = [
  { 
    title: '2025 Annual Budget Projection', 
    description: 'Comprehensive financial forecast for fiscal year 2025 including revenue projections, operational expenses, and capital expenditure planning.', 
    doc_type: 'report', 
    status: 'finalized', 
    tags: ['financial', 'business'] 
  },
  { 
    title: 'Master Services Agreement - TechCorp', 
    description: 'Binding service agreement outlining terms, deliverables, and payment schedule for ongoing technical consulting services.', 
    doc_type: 'contract', 
    status: 'reviewed', 
    tags: ['legal', 'business'] 
  },
  { 
    title: 'Office Lease Payment - March 2025', 
    description: 'Monthly rental invoice for commercial office space at 123 Business Plaza, including utilities and parking.', 
    doc_type: 'invoice', 
    status: 'finalized', 
    tags: ['financial'] 
  },
  { 
    title: 'Q1 2025 Tax Return Documents', 
    description: 'Completed quarterly tax filing forms with supporting documentation for business income, deductions, and estimated tax payments.', 
    doc_type: 'other', 
    status: 'draft', 
    tags: ['tax', 'financial'] 
  },
  { 
    title: 'Cloud Infrastructure Invoice - AWS', 
    description: 'Monthly billing statement for cloud computing services, storage, and bandwidth usage across production environments.', 
    doc_type: 'receipt', 
    status: 'finalized', 
    tags: ['financial', 'business'] 
  },
  { 
    title: 'Employee Handbook 2025', 
    description: 'Updated company policies, procedures, benefits information, and code of conduct for all staff members.', 
    doc_type: 'other', 
    status: 'reviewed', 
    tags: ['legal', 'business'] 
  },
  { 
    title: 'Professional Liability Insurance Policy', 
    description: 'Current year insurance coverage for errors and omissions with comprehensive liability protection.', 
    doc_type: 'contract', 
    status: 'finalized', 
    tags: ['legal'] 
  },
  { 
    title: 'Marketing Campaign ROI Analysis', 
    description: 'Detailed performance metrics and return on investment analysis for Q4 2024 digital marketing initiatives.', 
    doc_type: 'report', 
    status: 'finalized', 
    tags: ['business'] 
  }
]

created_documents = documents_data.map do |data|
  doc = Document.new(
    title: data[:title],
    description: data[:description],
    doc_type: data[:doc_type],
    status: data[:status]
  )
  
  # Attach sample PDF
  doc.file.attach(
    io: create_sample_pdf(data[:title]),
    filename: "#{data[:title].parameterize}.pdf",
    content_type: 'application/pdf'
  )
  
  doc.save!
  
  # Add tags
  data[:tags].each do |tag_name|
    tag = tags.find { |t| t.name == tag_name }
    doc.tags << tag if tag
  end
  
  puts "  Created: #{doc.title}"
  doc
end

puts "\nCreating sample collections..."

# Create collections
collection1 = Collection.create!(
  name: '2025 Financial Records',
  description: 'Complete set of financial documents, invoices, and receipts for the current fiscal year for accounting and audit purposes.'
)
collection1.add_document(created_documents[0]) # Annual Budget
collection1.add_document(created_documents[2]) # Office Lease
collection1.add_document(created_documents[4]) # AWS Invoice

collection2 = Collection.create!(
  name: 'Active Legal Contracts',
  description: 'Current binding agreements, service contracts, and legal documents requiring ongoing review and compliance monitoring.'
)
collection2.add_document(created_documents[1]) # Services Agreement
collection2.add_document(created_documents[6]) # Insurance Policy

collection3 = Collection.create!(
  name: 'Tax Documentation 2025',
  description: 'All tax-related forms, receipts, and supporting documentation for annual filing and quarterly estimated payments.'
)
collection3.add_document(created_documents[3]) # Q1 Tax Return

puts "  Created: #{collection1.name} (#{collection1.documents.count} documents)"
puts "  Created: #{collection2.name} (#{collection2.documents.count} documents)"
puts "  Created: #{collection3.name} (#{collection3.documents.count} documents)"

puts "\nSeed data created successfully!"
puts "  #{Document.count} documents"
puts "  #{Tag.count} tags"
puts "  #{Collection.count} collections"
