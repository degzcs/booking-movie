module Modules
  class Bookings < Grape::API
    resource :bookings do
      desc 'List of booking'
      params do
        requires :start_date, type: Date, desc: '2019-12-01'
        requires :end_date, type: Date, desc: '2019-12-05'
      end
      get :by_dates do
        service = GetBokkings.new
        service.call(params) do |result|
          result.success do |records|
            present records, with: Entities::Booking
          end

          result.failure do |message|
            message
          end
        end
      end
    end

    namespace 'movies/:movie_id' do
      params do
        requires :movie_id, type: Integer, desc: '1'
      end
      resource :bookings do
        desc 'Create a booking.'
        params do
          requires :date, type: Date, desc: '2019-09-10'
        end
        post do
          service = CreateBooking.new
          service.call(params) do |result|
            result.success do |record|
              present record, with: Entities::Booking
            end

            result.failure do |message|
              message
            end
          end
        end
      end
    end
  end
end
