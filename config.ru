require ::File.expand_path('../config/environment',  __FILE__)
require 'rack'

API.compile!
run API

