# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'zoku/version'

Gem::Specification.new do |spec|
  spec.name          = "zoku"
  spec.version       = Zoku::VERSION
  spec.authors       = ["DivXZero"]
  spec.email         = ["silv3rlogic@gmail.com"]

  spec.summary       = %q{Just another opinionated rails project generator.}
  spec.description   = %q{Rails project generator. Stack includes docker,\
                          postgres, redis, sidekiq, rspec}
  spec.homepage      = "https://github.com/DivXZero/zoku.git"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  #if spec.respond_to?(:metadata)
  #  spec.metadata['allowed_push_host'] = "http://mygemserver.com"
  #else
  #  raise "RubyGems 2.0 or newer is required to protect against " \
  #    "public gem pushes."
  #end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   = ["zoku"]
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", "~> 5.0.0.1"
  spec.add_dependency "thor", "~> 0.19.4"

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "yard", "~> 0.9.8"
end
