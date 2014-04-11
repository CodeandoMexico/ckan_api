require 'bundler/setup'
Bundler.setup

require 'ckan_api'
require_relative 'helpers/ckan_api_helpers.rb'

RSpec.configure do |config|
  config.include Helpers
end
