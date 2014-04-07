require_relative 'helpers/uri_helper'

#   Package CKAN API doc:
#   http://ckan.readthedocs.org/en/ckan-2.2/api.html
module CkanApi
  class Package < Model

    # Return a list of the names of the site’s
    # datasets (packages).
    # Params:
    # +options+:: hash object storing CKAN API params
    def self.list(options={})
      self.action = 'action/package_list'
      request_url = form_request_url(self.action, options)
      json_data = get_json_data(request_url)
      json_data['result']
    end

    # Searches for packages satisfying a given search criteria.
    # Params:
    # +options+:: hash object storing CKAN API params
    def self.search(options={})
      self.action = 'action/package_search'
      request_url = form_request_url(self.action, options)
      json_data = get_json_data(request_url)
      json_data['result']
    end

    # Return the metadata of a dataset (package) and its resources.
    # Params:
    # +options+:: hash object with "id" field, which is obligatory
    def self.show(options)
      self.action = 'action/package_show'
      request_url = form_request_url(self.action, options)
      json_data = get_json_data(request_url)
      json_data['result']
    end

  end
end
