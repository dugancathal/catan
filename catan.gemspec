# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'catan/version'

Gem::Specification.new do |spec|
  spec.name          = "catan"
  spec.version       = Catan::VERSION
  spec.authors       = ["TJ Taylor"]
  spec.email         = ["ttaylor@tendrilinc.com"]
  spec.description   = %q{TODO: Write a gem description}
  spec.summary       = %q{TODO: Write a gem summary}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'sqlite3'
  spec.add_dependency 'activerecord'
  spec.add_dependency 'enrar'
end
