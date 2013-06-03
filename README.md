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

Then, you can find drone strikes by a number of criteria. For example:

```ruby
Dronestream::Strike.in_country('Yemen')
#=> [{"_id"=>"51a65578e0932c0e1eb4199f", "number"=>1, "country"=>"Yemen", "date"=>"2002-11-03T00:00:00.000Z", "town"=>"", "location"=>"Marib Province", "deaths"=>"6", "deaths_min"=>"6", "deaths_max"=>"6", "civilians"=>"0", "injuries"=>"", "children"=>"", "tweet_id"=>"278544689483890688", "bureau_id"=>"YEM001", "bij_summary_short"=>"In the first known US targeted assassination using a drone, a CIA Predator struck a car killing six al Qaeda suspects.", "bij_link"=>"http://www.thebureauinvestigates.com/2012/03/29/yemen-reported-us-covert-actions-since-2001/", "target"=>"", "lat"=>"15.47467", "lon"=>"45.322755", "articles"=>[], "names"=>["Qa’id Salim Sinan al-Harithi, Abu Ahmad al-Hijazi, Salih Hussain Ali al-Nunu, Awsan Ahmad al-Tarihi, Munir Ahmad Abdallah al-Sauda, Adil Nasir al-Sauda’"]} ...
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Run tests (`rake spec`)
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request
