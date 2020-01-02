require 'sequel'

DB = Sequel.connect(ENV.fetch('DATABASE_URL'))

Dir["#{ APP_ROOT }/db/**/*.rb"].each { |file| require file }

