require_relative 'helpers/uri_helper'

module CkanApi
  class Resource < Model

    def self.create(package_id, url, body_params={})
      #Needs api key?
    end

    def self.delete(id, api_key)
      #TODO: not responding
      self.action = 'action/resource_delete'
      post_request(self.action, api_key, {id:id} )
    end

    # Return the metadata of a resource
    # Params:
    # +resource_id+:: "id" of the resource to show
    def self.show(resource_id)
      self.action = 'action/resource_show'
      get_request(self.action, id: resource_id)
    end

    def self.search(query, options={})
      options['query'] = hash_uri_encode(query, "&query=")
      self.action = 'action/resource_search'
      get_request(self.action, options)
    end

  end
end
