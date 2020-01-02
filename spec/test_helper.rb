# encoding: UTF-8
# frozen_string_literal: true
require 'rack/test'

module TestHelper
  include Rack::Test::Methods

  def app
    API
  end

  def response_as_json
    JSON.parse(last_response.body, :symbolize_names => true)
  end

  def remove_key(object, key)
    if object.is_a? Array
      object.each { |r| r.delete(:id) }
    else
      object.tap { |r| r.delete(:id) }
    end
  end
end

