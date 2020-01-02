module Entities
  class Movie < Grape::Entity
    expose :id
    expose :name
    expose :description
    expose :url
    expose :image
    expose :days_for_booking
  end
end
