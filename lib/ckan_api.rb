module CkanApi
  class Config

    def self.api_url
     @api_url ||= 'http://datamx.io/api/3/'
    end

    def self.api_url=(api_url)
      @api_url = api_url
    end

  end
end

require 'open-uri'
require 'net/http'
require 'uri'
require 'json'
require 'addressable/uri'
require_relative 'ckan_api/version'
require_relative 'ckan_api/model'
require_relative 'ckan_api/datastore'
require_relative 'ckan_api/package'
require_relative 'ckan_api/resource'
