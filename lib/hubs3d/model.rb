require "base64"
require "hubs3d/api"

module Hubs3D
  class Model
    attr_accessor :id, :name, :path
    def initialize(id: nil, name: nil, path: nil)
      @id = id
      @name = name
      @path = path
    end

    def id
      @id ||= post["modelId"].to_i
    end


    private

    def base_64
      Base64.encode64 open(@path, 'r') { |f| f.read }
    end

    def post
      API.post("/model", file: base_64, fileName: name)
    end
  end
end
