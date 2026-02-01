# Heroku Deployment Guide

## Quick Deploy

```bash
# Login to Heroku
heroku login

# Create new app
heroku create document-tracker-demo

# Add PostgreSQL
heroku addons:create heroku-postgresql:essential-0

# Set config vars
heroku config:set DEMO_MODE=true
heroku config:set RAILS_MASTER_KEY=$(cat config/master.key)

# Deploy
git push heroku main

# Run migrations and seed
heroku run rails db:migrate
heroku run rails db:seed

# Open app
heroku open
```

## Config Variables

### Required
- `RAILS_MASTER_KEY` - Copy from `config/master.key`
- `DATABASE_URL` - Automatically set by Heroku PostgreSQL addon

### Optional
- `DEMO_MODE` - Set to `true` for production (default behavior)

## Storage Notes

ActiveStorage uses local disk storage by default. On Heroku, this is ephemeral (resets on dyno restart).

For persistent storage in production:

1. Add S3 gem:
   ```ruby
   gem 'aws-sdk-s3', require: false
   ```

2. Update `config/storage.yml`:
   ```yaml
   amazon:
     service: S3
     access_key_id: <%= ENV['AWS_ACCESS_KEY_ID'] %>
     secret_access_key: <%= ENV['AWS_SECRET_ACCESS_KEY'] %>
     region: <%= ENV['AWS_REGION'] %>
     bucket: <%= ENV['AWS_BUCKET'] %>
   ```

3. Set production storage in `config/environments/production.rb`:
   ```ruby
   config.active_storage.service = :amazon
   ```

4. Add Heroku config vars:
   ```bash
   heroku config:set AWS_ACCESS_KEY_ID=your_key
   heroku config:set AWS_SECRET_ACCESS_KEY=your_secret
   heroku config:set AWS_REGION=us-east-1
   heroku config:set AWS_BUCKET=your-bucket-name
   ```

## Troubleshooting

### Assets not compiling
```bash
heroku run rails assets:precompile
```

### Database issues
```bash
heroku pg:reset DATABASE_URL
heroku run rails db:migrate
heroku run rails db:seed
```

### Logs
```bash
heroku logs --tail
```
