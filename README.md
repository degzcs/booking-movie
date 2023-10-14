# Booking Movies

Rack app for booking movies.

### Development

For creating new features or updating this project you can clone it and install the dependencies, as follows:

```bash
$ git clone git@github.com:degzcs/booking-movie.git
$ bundle install
```

### Local server

run this:

```
$ puma -p 3000

```

NOTE: make sure to have installed the 3.1.0 ruby version

### Tests

To run the specs exec this command:

```bash
$ rspec spec
```

### Production

This demo was deployed in Render. Use this url: https://booking-movie.onrender.com/

### Examples in Local

##### Create movie

```bash
$ curl -d "name=MosterCalls&description=fantasy&url=http://url.here&image=basse64here&days_for_booking[]=monday" -X POST http://localhost:3000/api/movies
```

##### Get Movies by week day

```bash
$ curl -d "day=monday" -X GET http://localhost:3000/api/movies/by_day
```

##### Create a booking

```bash
$ curl -d "date='2019-09-09'" -X POST http://localhost:3000/api/movies/1/bookings
```

##### Get Bookings

```bash
$ curl -d "start_date='2019-09-01'&end_date='2019-11-11'" -X GET http://localhost:3000/api/bookings/by_dates
```

### Contributors

- Diego Gomez
