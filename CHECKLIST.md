# Pre-Deployment Checklist

## Code Quality
- [x] All models have proper validations
- [x] Controllers are thin with business logic in models
- [x] Scopes used for query logic
- [x] Proper use of before_action callbacks
- [x] Error handling implemented

## Database
- [x] Migrations are reversible
- [x] Foreign keys defined
- [x] Indexes on frequently queried columns
- [x] Seed data creates valid sample records
- [x] No N+1 queries (includes/joins used appropriately)

## Security
- [x] Demo mode enforced server-side
- [x] File upload validation (type and size)
- [x] CSRF protection enabled (Rails default)
- [x] No sensitive data in version control
- [x] Master key properly secured

## UI/UX
- [x] Responsive design (mobile and desktop)
- [x] Loading states handled
- [x] Error messages user-friendly
- [x] Empty states designed
- [x] Forms have proper labels
- [x] Success/error flash messages

## Testing
- [x] System tests for main user flows
- [x] Demo mode blocking tested
- [x] Happy path tested
- [x] Edge cases considered

## Documentation
- [x] README with setup instructions
- [x] README with deployment guide
- [x] ENV variables documented
- [x] .env.example provided
- [x] Code comments where needed

## Deployment (Heroku)
- [ ] Heroku app created
- [ ] PostgreSQL addon added
- [ ] Config vars set (DEMO_MODE, RAILS_MASTER_KEY)
- [ ] Migrations run
- [ ] Seed data loaded
- [ ] App accessible and functional
- [ ] Demo mode verified active

## Post-Deployment
- [ ] Test document viewing
- [ ] Test collection viewing
- [ ] Verify mutating actions blocked
- [ ] Verify demo banner displays
- [ ] Check for any console errors
- [ ] Test on mobile device
- [ ] Verify PDF preview works

## Optional Enhancements
- [ ] Set up S3 for persistent storage
- [ ] Add custom domain
- [ ] Enable SSL (Heroku provides this)
- [ ] Set up error monitoring (Sentry, Rollbar)
- [ ] Configure CDN for assets

## GitHub Repository
- [ ] Repository is public
- [ ] Proper .gitignore (no secrets)
- [ ] README displays well on GitHub
- [ ] License file added
- [ ] Topics/tags added for discoverability
- [ ] Repository description set

## Final Checks
- [ ] App loads without errors
- [ ] All features work as expected
- [ ] Demo mode prevents spam
- [ ] Code is clean and readable
- [ ] No TODO comments left in production code
- [ ] Git history is clean (meaningful commits)
