class API < Grape::API
  version 'v1', using: :header, vendor: :degz
  prefix :api
  format :json

  helpers do
  end

  mount ::Modules::Movies
  mount ::Modules::Bookings
end

