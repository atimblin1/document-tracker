# Document Tracker - Project Summary

## What Was Built

A production-ready Rails application for managing PDF documents with:
- Document upload and management with status tracking
- Flexible tagging system
- Ordered collections (packets) for grouping documents
- Search and filtering capabilities
- Demo mode for safe public deployment

## Technical Highlights

### Clean Data Modeling
- Document, Tag, Collection models with proper relationships
- Join models (DocumentTag, CollectionItem) with additional attributes
- Position-based ordering for collection items
- Enum-style status and type fields with validation

### File Handling
- ActiveStorage integration for PDF uploads
- File type and size validation
- Inline PDF preview with download option
- Prepared for S3 integration in production

### Professional UI
- Tailwind CSS with restrained, modern design
- Responsive layout
- Status badges with semantic colors
- Empty states and helpful messaging
- Server-rendered HTML with Turbo for navigation

### Demo Mode (Anti-Spam)
- Environment variable controlled
- Server-side enforcement in controllers
- UI conditionally hides mutating controls
- Banner notification for users
- Default-on in production environment

### Testing
- System tests covering key flows
- Demo mode enforcement tests
- Happy path collection creation test
- Clean test setup with fixtures

## File Structure

```
app/
├── controllers/
│   ├── application_controller.rb      # Demo mode guard
│   ├── documents_controller.rb        # Full CRUD + search/filter
│   ├── collections_controller.rb      # Collection management
│   ├── collection_items_controller.rb # Add/remove/reorder
│   └── document_tags_controller.rb    # Tag add/remove
├── models/
│   ├── document.rb           # Validations, scopes, file attachment
│   ├── tag.rb               # Name normalization
│   ├── collection.rb        # Ordering helper
│   ├── document_tag.rb      # Join model
│   └── collection_item.rb   # Join with position + move methods
├── views/
│   ├── shared/
│   │   ├── _navbar.html.erb
│   │   └── _demo_banner.html.erb
│   ├── documents/
│   │   ├── index.html.erb   # Search/filter + list
│   │   ├── show.html.erb    # PDF preview + tags
│   │   ├── _form.html.erb
│   │   ├── new.html.erb
│   │   └── edit.html.erb
│   └── collections/
│       ├── index.html.erb
│       ├── show.html.erb    # Ordered items + add/reorder
│       ├── _form.html.erb
│       ├── new.html.erb
│       └── edit.html.erb
db/
├── migrate/
│   ├── create_documents.rb
│   ├── create_tags.rb
│   ├── create_document_tags.rb
│   ├── create_collections.rb
│   ├── create_collection_items.rb
│   └── create_active_storage_tables.rb
└── seeds.rb                 # Sample data generator
test/
└── system/
    ├── documents_test.rb
    └── collections_test.rb
```

## Features Implemented

✅ Document upload with PDF validation
✅ Document types and statuses (enums)
✅ Tag system with join model
✅ Search by title (ILIKE)
✅ Filter by status, type, tag
✅ Collections with many-to-many relationship
✅ Ordered collection items with move up/down
✅ Inline PDF preview
✅ Demo mode with ENV var control
✅ Server-side demo mode enforcement
✅ UI hiding for mutating actions
✅ Demo banner notification
✅ Tailwind styling (professional, not flashy)
✅ Responsive design
✅ System tests
✅ Seed data
✅ Comprehensive README
✅ Deployment guide
✅ Heroku-ready configuration

## Deployment Readiness

- PostgreSQL configured
- ActiveStorage set up (disk storage, S3-ready)
- Procfile for Heroku
- Environment variable documentation
- Migration strategy documented
- Demo mode default-on in production

## Code Quality Notes

- Controllers are thin (business logic in models)
- Model scopes for query logic
- Validations at model level
- Custom validation for file attachments
- Consistent naming conventions
- RESTful routes
- Semantic HTML with accessibility in mind
- No JavaScript framework bloat (Turbo only)

## Portfolio Value

This project demonstrates:
- Clean Rails conventions
- Proper relationship modeling (1:many, many:many with attributes)
- File upload handling
- Search and filtering
- UI/UX polish without over-engineering
- Public deployment safety (demo mode)
- Test coverage of critical paths
- Professional documentation
- Production deployment readiness

Upper-level junior / entry mid-level Rails competency.
