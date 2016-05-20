# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ehealth/version'

Gem::Specification.new do |spec|
  spec.name          = "ehealth"
  spec.version       = Ehealth::VERSION
  spec.authors       = ["Skyler Layne"]
  spec.email         = ["skylerclayne@gmail.com"]

  spec.summary       = %q{eHealth is a system which manages patient prescriptions}
  spec.homepage      = "https://github.com/skylerto/ehealth"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_development_dependency "rspec"
end
