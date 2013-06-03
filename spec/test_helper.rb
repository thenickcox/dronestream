require 'dronestream'
require 'rspec'
require 'vcr'
require 'webmock/rspec'

 
#VCR config
VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/dronestream_cassettes'
  c.hook_into :webmock
end

RSpec.configure do |config|
  # Use color in STDOUT
  config.color_enabled = true

  # Use color not only in STDOUT but also in pagers and files
  config.tty = true

  # Use the specified formatter
  config.formatter = :documentation # :progress, :html, :textmate
end

