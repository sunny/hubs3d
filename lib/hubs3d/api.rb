require "json"
require "oauth" # https://github.com/oauth-xx/oauth-ruby

# To help debugging:
# require 'net-http-spy'
# Net::HTTP.http_logger_options = {:verbose => true}

require "hubs3d/configuration"

module Hubs3D
  module API
    module_function
    def post(path, params = {})
      consumer = OAuth::Consumer.new(Configuration.oauth_key,
                                     Configuration.oauth_secret,
                                     site: Configuration.api_site)
      token = OAuth::AccessToken.new(consumer)
      response = token.post(Configuration.api_path + path,
                            params,
                            "Accept" => "application/json")
      JSON.parse(response.body)
    end
  end
end
