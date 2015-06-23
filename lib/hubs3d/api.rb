require "json"
require "oauth"

# To help debugging:
# require 'net-http-spy'
# Net::HTTP.http_logger_options = {:verbose => true}

require "hubs3d/configuration"
require "hubs3d/error"

module Hubs3D
  module API
    module_function
    def post(path, params = {})
      consumer = OAuth::Consumer.new(Hubs3D.configuration.oauth_key,
                                     Hubs3D.configuration.oauth_secret,
                                     site: Hubs3D.configuration.api_site)
      token = OAuth::AccessToken.new(consumer)
      response = token.post(Hubs3D.configuration.api_path + path,
                            params,
                            "Accept" => "application/json")
      body = JSON.parse(response.body)

      if response.code == "200"
        body
      else
        fail Error, "API #{response.code}: #{body.join(" ")}"
      end
    end
  end
end
