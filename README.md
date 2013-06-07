# Dronestream

A Ruby wrapper for the [dronestre.am](http://dronestre.am) API. 

This is a work in progress. If you'd like to help, check out the current [issues](https://github.com/thenickcox/dronestream/issues). Alternately, you can report further issues, or work on a new one.

## Installation

Add this line to your application's Gemfile:

    gem 'dronestream'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dronestream

## Usage

First, require it:

```ruby
require 'dronestream'
#=> true
```

Then, you can find strikes by a number of criteria. Version 0.2.3 allows you to chain methods together to combine data points in your query. However, each query returns an instance of the class. To get the data out in a usable format (say, for looping over), simply call `to_a` on the return value of your query.

```ruby
>> Dronestream::Strike.in_country('Yemen')
#=> Dronestream::Strike
>> Dronestream::Strike.in_country('Yemen').to_a
#=> [{"_id"=>"51a65578e0932c0e1eb4199f", "number"=>1, "country"=>"Yemen", "date"=>"2002-11-03T00:00:00.000Z", "town"=>"", "location"=>"Marib Province", "deaths"=>"6", "deaths_min"=>"6", "deaths_max"=>"6", "civilians"=>"0", "injuries"=>""...

>> yemini_strikes_with_civilian_casualties = Dronestream::Strike.in_country('Yemen').with_civilian_casualties
#=> Dronestream::Strike
>> yemini_strikes_with_civilian_casualties.to_a
#=> [{"_id"=>"51a6557ae0932c0e1eb41aad", "number"=>271, "country"=>"Yemen", "date"=>"2011-06-03T00:00:00.000Z", "town"=>"Zinjibar", "location"=>"Abyan Province", "deaths"=>"7", "deaths_min"=>"7", "deaths_max"=>"7", "civilians"=>"4", "injuries"=>""
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Run tests (`rake spec`)
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request

## Acknowledgements

Obviously, this gem couldn't be possible without the [dronestream API](http://dronestream.org). So thank you to [Josh Begley](http://joshbegley.com/) for the API. Thanks also to [@ashedryden](http://twitter.com/ashedryden) for turning me onto [hasadronekilledanyonetoday.com](http://hasadronekilledanyonetoday.com) by [Chris Zarate](https://github.com/chriszarate/hadkat), where I discovered the source.
