require 'rubygems'
require 'bundler/setup'
#require './config/environment'
require 'sinatra'
require "sinatra/json"
require "sinatra/reloader"
require 'grape'
ENV['RACK_ENV'] = 'development' if ENV['RACK_ENV'].nil?
Bundler.require(:default, ENV['RACK_ENV'])

APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))
APP_NAME = APP_ROOT.basename.to_s
require APP_ROOT.join('app')
Figaro::Application.new(environment: ENV['RACK_ENV'], path: 'config/application.yml').load

require './config/database.rb'
Dir["#{ APP_ROOT }/lib/**/*.rb"].each { |file| require file }

BookingMovie.configure do |config|
  #config.autoload :Tenant, 'lib/models/tenant'
  config.set :root, APP_ROOT.to_path
  set :server, :puma

  enable :sessions
	# Don't log them. We'll do that ourself
	set :dump_errors, false

	# Don't Captures any errors. Throw them up the stack
	set :raise_errors, true

	# Disable internal middleware for presenting errors
	# as useful HTML pages
	set :show_exceptions, false
  configure :development do
    require 'pry'
    register Sinatra::Reloader
    also_reload  APP_ROOT.join('lib/models')
    also_reload  APP_ROOT.join('lib/middlewares')
    #after_reload { puts 'reloaded' }
  end

  use ErrorsHandling
  use Rack::Session::Cookie
end
Dir["#{ APP_ROOT }/db/**/*.rb"].each { |file| require file }

