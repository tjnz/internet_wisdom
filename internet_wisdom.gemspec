# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'internet_wisdom/version'

Gem::Specification.new do |spec|
  spec.name          = "internet-wisdom"
  spec.version       = InternetWisdom::VERSION
  spec.authors       = ["Tom Johns"]
  spec.email         = ["tommyskies@hotmail.com"]

  spec.summary       = %q{Internet Wisdom!}
  spec.description   = %q{Bits of wisdom from the internet}
  spec.homepage      = "https://github.com/tjnz/internet_wisdom"
  spec.license       = "MIT"
  
  spec.files         = `git ls-files`.split($\)
  spec.executables   = ["internet-wisdom"]
  spec.require_paths = ["lib", "lib/internet_wisdom"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
  
  spec.add_dependency "launchy"
  spec.add_dependency "nokogiri"

  
end
