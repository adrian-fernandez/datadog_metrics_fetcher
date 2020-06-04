# datadog_metrics_fetcher

## Setup
Set your API key and Application Key on `API_KEY` and `APPLICATION_KEY`
Define your list of applications and metrics to fetch in `APPLICATIONS`

## Usage
`ruby dog.rb <year> <month>`

Example:
`ruby dog.rb 2020 5`

## Sample output
```
$ ruby dog.rb 2020 5
bsa-notifications
*****************
  Amenity	11.1
  Booking	236.75
  Bookings Fee	27.12
  Bookings Tag	24.42
```
