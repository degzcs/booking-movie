module Modules
  class Movies < Grape::API
    resource :movies do
      desc 'List movies'
      params do
        requires :day, type: String, desc: 'lunes o martes'
      end
      get :by_day do
        service = GetMovies.new
        service.call(params) do |result|
          result.success do |records|
            present records, with: Entities::Movie
          end
          result.failure {}
        end
      end

      desc 'Create a Movie.'
      params do
        requires :name, type: String, desc: 'Movie name.'
        requires :description, type: String, desc: 'Short description about the movie'
        requires :url, type: String, desc: 'http://someurl.here'
        requires :image, type: String, desc: 'Base64 cover image'
      end
      post do
        service = CreateMovie.new
        service.call(params) do |result|
          result.success do |record|
            present record, with: Entities::Movie
          end
          result.failure do |record|
            record.full_messages
          end
        end
      end
    end
  end
end

