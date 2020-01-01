module Modules
  class Movies < Grape::API
    resource :movies do
      desc 'List movies'
      params do
        requires :day, type: String, desc: 'lunes o martes'
      end
      get :by_day do
      end

      desc 'Create a Movie.'
      params do
        requires :name, type: String, desc: 'Movie name.'
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

