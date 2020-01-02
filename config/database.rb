require 'sequel'

DB = if ENV['RACK_ENV'] == 'production'
        Sequel.connect("postgresql://#{ENV["POSTGRES_USER"]}:#{ENV["POSTGRES_PASSWORD"]}@#{ENV["POSTGRES_HOST"]}:#{ENV["POSTGRES_PORT"]}/#{ENV["POSTGRES_DB"]}")
     else
        Sequel.connect(ENV.fetch('DATABASE_URL'))
     end


Dir["#{ APP_ROOT }/db/**/*.rb"].each { |file| require file }

