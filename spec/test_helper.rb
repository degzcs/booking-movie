# encoding: UTF-8
# frozen_string_literal: true
require 'rack/test'

module TestHelper
  include Rack::Test::Methods

  def app
    BookingMovie
  end

  def response_as_json
    JSON.parse(last_response.body, :symbolize_names => true)
  end
end

