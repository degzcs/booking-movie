Booking Movies
==

Rack app for booking movies.

### Development

For creating new features or updating this project you can clone it and install the dependencies, as follows:

```bash
$ git clone <url>
$ bundle install --without=production
```

NOTE: make sure to have installed the 2.5.1 ruby version

### Tests
To run the specs exec this command:

```bash
$ rspec spec
```

### Deploy
This application was deployed on Heroku [here](https://booking-movies.herokuapp.com/)

### Examples

##### Create movie
```bash
$ curl -d "name=MosterCalls&description=fantasy&url=http://url.here&image=basse64here&days_for_booking[]=monday" -X POST https://booking-movies.herokuapp.com/api/movies
```

##### Get Movies by week day
```bash
$ curl -d "day=monday" -X GET https://booking-movies.herokuapp.com/api/movies/by_day
```

##### Create a booking
```bash
$ curl -d "date='2019-09-09'" -X POST https://booking-movies.herokuapp.com/api/movies/1/bookings
```

##### Get Bookings
```bash
$ curl -d "start_date='2019-09-01'&end_date='2019-11-11'" -X GET https://booking-movies.herokuapp.com/api/bookings/by_dates
```

### Contributors
- Diego Gomez

