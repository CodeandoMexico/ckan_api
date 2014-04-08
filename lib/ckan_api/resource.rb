require_relative 'helpers/uri_helper'

module CkanApi
  class Resource < Model

    # Return the metadata of a resource
    # Params:
    # +resource_id+:: "id" of the resource to show
    def self.show(resource_id)
      self.action = 'action/resource_show'
      request_url = form_request_url(self.action, id: resource_id)
      json_data = get_json_data(request_url)
      json_data['result']
    end

  end
end
