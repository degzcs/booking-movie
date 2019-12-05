require 'sinatra/sequel'
require 'sequel'

# Establish the database connection; or, omit this and use the DATABASE_URL
# environment variable as the connection string:
set :database, ENV.fetch('DATABASE_URL')

Dir["#{ APP_ROOT }/db/**/*.rb"].each { |file| require file }

