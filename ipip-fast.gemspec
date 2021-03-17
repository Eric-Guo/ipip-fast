# frozen_string_literal: true

require_relative "lib/ipip/fast/version"

Gem::Specification.new do |spec|
  spec.name          = "ipip-fast"
  spec.version       = Ipip::Fast::VERSION
  spec.authors       = ["Eric-Guo"]
  spec.email         = ["eric.guocz@gmail.com"]

  spec.summary       = "Same function as ipip-ipdb, only faster."
  spec.description   = "Same function as ipip-ipdb, only faster."
  spec.homepage      = "https://github.com/Eric-Guo/ipip-fast#ipip-fast-"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.4.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Eric-Guo/ipip-fast"

  spec.files = Dir['{lib}/**/*'] + %w[README.md]
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'ruby-prof-flamegraph', '>= 0.3.0'

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
