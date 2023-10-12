require 'rubygems'
require 'bundler/setup'
require 'grape'
require 'dry/monads/all'
ENV['RACK_ENV'] = 'development' if ENV['RACK_ENV'].nil?
Bundler.require(:default, ENV['RACK_ENV'])

APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))
APP_NAME = APP_ROOT.basename.to_s
Dir["#{ APP_ROOT }/app/api/modules/*.rb"].each { |file| require file }
require APP_ROOT.join('app', 'api','api')
Figaro::Application.new(environment: ENV['RACK_ENV'], path: 'config/application.yml').load

require './config/database.rb'
Dir["#{ APP_ROOT }/app/**/*.rb"].each { |file| require file }
Dir["#{ APP_ROOT }/db/**/*.rb"].each { |file| require file }

