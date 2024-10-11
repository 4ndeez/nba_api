# frozen_string_literal: true

require_relative "lib/nba_api/version"

Gem::Specification.new do |spec|
  spec.name          = "nba_api"
  spec.version       = NbaApi::VERSION
  spec.authors       = ["4ndeez"]
  spec.email         = ["andissteam@gmail.com"]
  spec.homepage      = "https://github.com/4ndeez/nba_api"
  spec.summary       = "A Ruby client for interacting with the NBA API"
  spec.description   = "This gem provides a Ruby client to communicate with the NBA API endpoints and fetch data."
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.4.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport"
  spec.add_dependency "httparty", "~> 0.18.1"
  spec.add_dependency "json"
  spec.add_dependency "stringio"
  spec.add_dependency "zlib"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
