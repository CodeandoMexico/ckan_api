require_relative 'helpers/uri_helper'

module CkanApi
  class Package < Model

    # Return a list of the names of the site’s
    # datasets (packages).
    # Params:
    # +options+:: hash object, can have optional limit and offset values
    def self.list(options={})
      self.action = 'action/package_list'
      request_url = form_request_url(self.action, options)
      json_data = get_json_data(request_url)
      json_data['result']
    end

  end
end
