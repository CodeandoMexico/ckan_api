require_relative 'helpers/uri_helper'

module CkanApi
  class Resource < Model

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
