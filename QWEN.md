# API Images - QWEN Context

## Project Overview

**API Images** is a Rails 5.2 API-only application for managing image uploads and related content. It provides a RESTful API for handling items with images, user authentication via JWT, and expense (egresos) image management.

### Key Technologies

- **Ruby**: 2.7.8
- **Rails**: 5.2.8.1
- **Database**: MySQL (via `mysql2` gem)
- **Authentication**: JWT via `knock` gem with `bcrypt` for password hashing
- **File Uploads**: CarrierWave (local file storage)
- **Server**: Puma
- **Deployment**: Capistrano 3.13 with Nginx + Puma stack

### Architecture

This is an **API-only Rails application** (`config.api_only = true`), meaning it:
- Skips session, flash, and cookie middleware by default
- Does not serve views or assets
- Returns JSON responses for all endpoints
- Uses Rack CORS for cross-origin request handling

## Database Schema

The application manages three main models:

| Model | Table | Description |
|-------|-------|-------------|
| `Item` | `items` | Content items with title, description, and image |
| `User` | `users` | Authenticated users with email/password |
| `Egreso` | `egresos` | Expense records with image attachments |

### Model Details

- **Item**: Has `title`, `description`, and `image_url` (all required). Uses CarrierWave uploader (`ItemImageUploader`).
- **User**: Has `email`, `name`, and `password_digest`. Email must be unique. Implements `to_token_payload` for JWT token generation.
- **Egreso**: Has `image` field. Uses the same `ItemImageUploader` for file uploads.

## API Endpoints

| Method | Path | Controller | Description |
|--------|------|------------|-------------|
| POST | `/user_token` | `user_token#create` | Authenticate and get JWT token |
| GET | `/users/current` | `users#current` | Get current authenticated user |
| GET | `/users` | `users#index` | List all users |
| POST | `/users` | `users#create` | Create a new user |
| GET | `/users/:id` | `users#show` | Get user details |
| PATCH/PUT | `/users/:id` | `users#update` | Update user |
| DELETE | `/users/:id` | `users#destroy` | Delete user |
| GET | `/items` | `items#index` | List all items |
| GET | `/items/:id` | `items#show` | Get item details |
| POST | `/items` | `items#create` | Create new item with image |
| PATCH/PUT | `/items/:id` | `items#update` | Update item |
| DELETE | `/items/:id` | `items#destroy` | Delete item |
| GET | `/egresos` | `egresos#index` | List expenses |
| GET | `/egresos/:id` | `egresos#show` | Get expense details |
| POST | `/egresos` | `egresos#create` | Create expense with image |

## Building and Running

### Prerequisites

- Ruby 2.7.8 (managed via RVM)
- MySQL database
- Bundler

### Setup Commands

```bash
# Install dependencies
bundle install

# Setup database (create, migrate, seed)
rails db:setup

# Or run migrations separately
rails db:migrate
rails db:seed

# Start development server
rails server
# or
rails s

# Start on specific port
rails s -p 3001
```

### Database Configuration

- Database name: `caimages`
- Credentials stored via Rails encrypted credentials (`mysql_username`, `mysql_password`)
- Production uses Unix socket: `/var/run/mysqld/mysqld.sock`

### Running Tests

```bash
rails test
```

### Rails Console

```bash
rails console
# or
rails c
```

## File Uploads

- **Uploader**: `ItemImageUploader` (CarrierWave)
- **Storage**: Local file system (`storage :file`)
- **Storage Path**: `uploads/{model_name}/{model_id}/`
- **Allowed Extensions**: jpg, jpeg, gif, png
- **Fog (cloud storage)**: Available but commented out

## Authentication

Uses **Knock** gem for JWT authentication:

1. POST to `/user_token` with `{email, password}` to get a JWT token
2. Include token in `Authorization` header as `Bearer <token>` for subsequent requests
3. `before_action :authenticate_user` can be uncommented in controllers to enforce auth

## Deployment

Deployment is handled via **Capistrano** with the following stack:

- **Capistrano 3.13** for deployment orchestration
- **RVM** for Ruby version management
- **Nginx** as reverse proxy
- **Puma** as application server
- **Systemd** for process management

### Deployment Commands

```bash
# Deploy to production
cap production deploy

# Deploy to staging (if configured)
cap staging deploy
```

Configuration files are managed via `capistrano-upload-config`.

## Configuration Files

| File | Purpose |
|------|---------|
| `Gemfile` | Ruby dependencies |
| `config/database.yml` | Database connection |
| `config/routes.rb` | API routes |
| `config/initializers/cors.rb` | CORS settings (currently allows all origins `*`) |
| `config/initializers/knock.rb` | JWT authentication settings |
| `Capfile` | Capistrano deployment setup |

## Project Structure

```
app/
├── controllers/        # API controllers (items, users, egresos, user_token)
├── models/            # ActiveRecord models (item, user, egreso)
├── uploaders/         # CarrierWave uploaders (item_image_uploader)
├── channels/          # ActionCable channels
├── jobs/              # Background jobs
├── mailers/           # Email mailers
└── views/             # Views (minimal for API-only app)

config/
├── initializers/      # App initializers
├── environments/      # Environment configs
└── routes.rb          # API routes

db/
├── migrate/           # Database migrations
└── schema.rb          # Current schema
```

## Development Conventions

- **Annotations**: Models use `annotate` gem to include schema information at the top of model files
- **Bullet**: Used for N+1 query detection in development
- **Spring**: Preloads Rails environment for faster command execution
- **Byebug**: Available for debugging in development
- **Parameter Security**: Controllers use strong parameters (e.g., `item_params` method)

## Security Notes

- CORS is currently configured to allow all origins (`origins '*'`) - may need restriction for production
- Credentials are stored using Rails encrypted credentials
- Password digests use bcrypt
- SSH keys use ed25519 and bcrypt_pbkdf for security

## Useful Rails Commands

```bash
# Run specific controller test
rails test test/controllers/items_controller_test.rb

# Run a specific migration
rails db:migrate:status

# Check routes
rails routes

# Encrypted credentials
rails credentials:edit

# Precompile assets (if needed)
rails assets:precompile

# Clean tmp/cache
rails tmp:clear
```
