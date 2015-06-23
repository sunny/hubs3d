$:.push File.expand_path("../lib", __FILE__)

require "hubs3d/version"

Gem::Specification.new do |s|
  s.name        = "hubs3d"
  s.version     = Hubs3D::VERSION
  s.authors     = ["Sunny Ripert"]
  s.email       = ["sunny@sunfox.org"]
  s.homepage    = "http://github.com/sunny/hubs3d"
  s.summary     = "Access the 3D Hubs API"
  s.description = "Upload 3D Models and create carts on 3D Hubs"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rest-client"
  s.add_dependency "oauth"

  s.add_development_dependency "webmock"
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
end
