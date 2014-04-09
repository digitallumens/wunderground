# Wunderground

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'wunderground'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install wunderground

## Usage

geolookup = Wunderground::Geolookup(zip: 02125)  # or ip, city+state, country+city, airport, lat+lon
geolookup.state => 'MA'
geolookup.city => 'Dorchester'
geolookup.coordinates => { latitude: 42.31518173, longitude: -71.05908203 }

conditions = Wunderground::Conditions(geolookup)  # or geolookup inputs
conditions.temperature_in_c => 30
conditions.temperature_in_f => 70
conditions.wind_kph => 4
conditions.humidity => 65
...

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request