require "hubs3d/api"

module Hubs3D
  class Configuration
    attr_accessor :oauth_key
    attr_accessor :oauth_secret
    attr_accessor :api_site
    attr_accessor :api_path

    def initialize
      @api_site = "http://test.3dhubs.com"
      @api_path = "/api/v1"
    end
  end

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end
end
