require 'httparty'
require 'dronestream/version'
require 'net/http'
require 'json'
require 'ostruct'

require "httparty"

Dir[File.dirname(__FILE__) + '/dronestream/*.rb'].each do |file|
  require file
end
