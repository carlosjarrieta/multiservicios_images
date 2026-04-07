source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.8"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "rails", "5.2.8.1"
# Use mysql as the database for Active Record
gem "mysql2", ">= 0.4.4", "< 0.6.0"
# Use Puma as the app server
gem "puma"

gem "knock"
gem "bcrypt", "~> 3.1.7"

gem "bootsnap", ">= 1.1.0", require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem "rack-cors"
gem "carrierwave"
gem "ed25519"
gem "bcrypt_pbkdf"

group :development do
  gem "capistrano", "3.13", require: false
  gem "capistrano-bundler", require: false
  gem "capistrano-rails", require: false
  gem "capistrano-rvm", github: "capistrano/rvm", require: false
  gem "capistrano-nvm", require: false
  gem "capistrano-ssh-doctor", require: false
  gem "capistrano-yarn"
  gem "capistrano3-puma", "~> 5.2"
  gem "capistrano3-nginx", "~> 3.0"
  gem "capistrano-upload-config", "~> 0.9.0"
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "annotate"
  gem "bullet"
end

gem "net-http", "~> 0.3.2"
gem "net-http2", "~> 0.18.5"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
