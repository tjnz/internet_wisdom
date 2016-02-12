# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'internet_wisdom/version'

Gem::Specification.new do |spec|
  spec.name          = "internet_wisdom"
  spec.version       = InternetWisdom::VERSION
  spec.authors       = ["Tom Johns"]
  spec.email         = ["tommyskies@hotmail.com"]

  spec.summary       = %q{Bits of wisdom from the internet}
  spec.description   = %q{Bits of wisdom from the internet}
  spec.homepage      = "https://github.com/tjnz/internet_wisdom"
  spec.license       = "MIT"

  

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
  
  spec.add_dependency "launchy"
  spec.add_dependency "nokogiri"

  
end
