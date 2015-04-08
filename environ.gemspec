# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'environ/version'

Gem::Specification.new do |spec|
  spec.name          = "environ"
  spec.version       = Environ::VERSION
  spec.authors       = ["Matt Mondok"]
  spec.email         = ["mattm@edentech.net"]

  spec.summary       = %q{A gem to access environment variables in a OOP way.}
  spec.description   = %q{A gem to access environment variables in a OOP way.  Rather than relying on ENV and strings, Environ lets you access the variables as objects.}
  spec.homepage      = "https://github.com/mondok/environ"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "rake"
end
