source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

gem "rails", "6.1.7.10"
gem "mysql2", ">= 0.4.4", "< 0.6.0"
gem "puma", "~> 5.0"

gem "knock"
gem "bcrypt", "~> 3.1"

gem "bootsnap", ">= 1.1.0", require: false

gem "rack-cors"
gem "carrierwave", "~> 3.1"
gem "ed25519", "~> 1.3"
gem "bcrypt_pbkdf", "~> 1.1"

gem "net-http", "~> 0.3.2"
gem "net-http2", "~> 0.18.5"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem "listen"
  gem "annotate", "~> 3.2"
  gem "bullet"

  gem "capistrano", "~> 3.18", require: false
  gem "capistrano-bundler", require: false
  gem "capistrano-rails", require: false
  gem "capistrano-rvm", github: "capistrano/rvm", require: false
  gem "capistrano-nvm", require: false
  gem "capistrano-ssh-doctor", require: false
  gem "capistrano-yarn"
  gem "capistrano3-puma", "~> 5.2"
  gem "capistrano3-nginx", "~> 3.0"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]


