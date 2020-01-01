module Modules
  class Bookings < Grape::API
    resource :booking do
      desc 'List booking'
      params do
        requires :start_date, type: Date, desc: '2019-12-01'
        requires :end_date, type: Date, desc: '2019-12-05'
      end
      get :by_day do
      end

      desc 'Create a booking.'
      params do
        requires :date, type: Date, desc: '2019-09-10'
      end
      post do
      end
    end
  end
end
