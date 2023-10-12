source 'https://rubygems.org'

ruby '3.1.0'

gem 'sequel'
gem 'puma'
gem 'figaro'
gem 'grape'
gem 'dry-transaction'
gem 'grape-entity'

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'sqlite3'
  gem 'awesome_print'
  gem 'pry'
  gem 'pry-byebug'
  gem 'rspec'
end

group :test do
  gem 'factory_bot'
  gem 'rack-test'
end

