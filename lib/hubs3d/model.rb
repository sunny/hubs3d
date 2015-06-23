require "base64"
require "hubs3d/api"

module Hubs3D
  class Model
    attr_reader :name, :path, :attachments

    def initialize(id: nil,
                   name: nil,
                   path: nil,
                   attachments: nil)
      @id = id
      @name = name
      @path = path
      @attachments = attachments
    end

    def id
      @id ||= begin
        result = post
        fail "Expected #{result.inspect} to have modelId" if !result["modelId"]
        result["modelId"].to_i
      end
    end


    private

    def base_64_file
      Base64.encode64 open(@path, 'r') { |f| f.read }
    end

    def post
      params = {
        file: base_64_file,
        fileName: name,
      }
      params[:attachments] = attachments if attachments
      API.post("/model", params)
    end
  end
end
