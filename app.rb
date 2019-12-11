class API < Grape::API
 version 'v1', using: :header, vendor: 'twitter'
  format :json
  prefix :api

  helpers do
  end

  resource :movies do
    desc 'List movies'
    params do
      require :day, type: String, desc: 'lunes o martes'
    end
    get :by_day do
    end

    desc 'Create a Movie.'
    params do
      requires :name, type: String, desc: 'Movie name.'
    end
    post do
    end
  end

  resource :booking do
    desc 'List booking'
    params do
      require :start_date, type: Date, desc: '2019-12-01'
      require :end_date, type: Date, desc: '2019-12-05'
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
