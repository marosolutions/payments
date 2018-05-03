$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "payments/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "payments"
  s.version     = Payments::VERSION
  s.authors     = [""]
  s.email       = [""]
  s.homepage    = "https://github.com/marosolutions/payments"
  s.summary     = "Gem to use the Maropost Gateway application API."
  s.description = "Gem to use the Maropost Gateway application API."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.0"

  s.add_dependency "httparty", "~> 0.16.0"
end
