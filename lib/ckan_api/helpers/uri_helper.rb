def get_uri_query_values(query_values)
  uri = Addressable::URI.new
  uri.query_values = query_values
  uri.query
end

# Transforms a hash to a query uri
def hash_uri_encode(hash, separator="&")
  uri_array = []
  hash.each do |key, value|
    uri_array << "#{key}:#{value}"
  end
  uri_array.join(separator)
end

def form_request_url(action, query_params={})
  query_values = get_uri_query_values(query_params)
  action + "?#{query_values}"
end

# Performs get requests
# Params:
# +action+:: The action endpoint to request
# +query_params+:: The get query params
# +fields+:: Is the field to return from the JSON response. Optional, defaults to 'result'.
def get_request(action, query_params={}, field='result')
  request_url = form_request_url(action, query_params)
  json_data = get_json_data(request_url)
  json_data[field]
end

# Performs post requests oriented to CKAN
# Params:
# +action+:: The action endpoint to request
# +api_key+:: User's key in ckan profile
# +body_params+:: attributes of the newly created package
def post_request(action, api_key, body_params, field='result')
  json_data = post_json_data(action, api_key, body_params)
  json_data[field]
end
