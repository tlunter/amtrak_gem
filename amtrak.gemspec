# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'amtrak/version'

Gem::Specification.new do |spec|
  spec.name          = 'amtrak'
  spec.version       = Amtrak::Version::VERSION
  spec.authors       = ['Todd Lunter']
  spec.email         = ['tlunter@gmail.com']
  spec.description   = %q{Scrape train times from Amtrak.com}
  spec.summary       = %q{Scrape train times from Amtrak.com}
  spec.homepage      = 'https://github.com/tlunter/amtrak_gem'
  spec.license       = 'MIT'
  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%{^bin/_}) { File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'excon', '~> 0.41.0'
  spec.add_dependency 'nokogiri', '~> 1.6.4'

  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rspec', '~> 3.0.0'
  spec.add_development_dependency 'rubocop', '~> 0.25.0'
  spec.add_development_dependency 'simplecov', '~> 0.8.2'
  spec.add_development_dependency 'vcr', '~> 2.9.2'
end
