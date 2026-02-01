# Contributing to Document Tracker

Thank you for your interest in contributing! This is a portfolio project, but improvements and suggestions are welcome.

## Getting Started

1. Fork the repository
2. Clone your fork
3. Follow the setup instructions in README.md
4. Create a feature branch: `git checkout -b feature/your-feature-name`

## Development Guidelines

### Code Style
- Follow Ruby style guide (Rubocop configured)
- Keep controllers thin, models fat
- Write meaningful commit messages
- Add tests for new features

### Testing
```bash
# Run all tests
bin/rails test

# Run system tests
bin/rails test:system

# Run specific test
bin/rails test test/system/documents_test.rb
```

### Database Changes
- Create migrations for schema changes
- Update seeds.rb if needed for demo data
- Test migrations both up and down

### UI Changes
- Keep Tailwind classes consistent with existing patterns
- Test on mobile and desktop viewports
- Maintain accessibility (semantic HTML, proper labels)

## Pull Request Process

1. Update README.md if you've changed functionality
2. Ensure all tests pass
3. Update CHANGELOG.md (if major changes)
4. Describe your changes clearly in the PR description

## Areas for Contribution

Potential improvements:
- Additional document types
- Advanced search (full-text)
- Document version history
- User authentication (multi-tenant)
- Export collections as ZIP
- Bulk operations
- API endpoints
- Internationalization

## Questions?

Open an issue for discussion before starting major changes.
