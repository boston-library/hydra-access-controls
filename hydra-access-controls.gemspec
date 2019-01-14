# -*- encoding: utf-8 -*-
version = '8.2.0'

Gem::Specification.new do |gem|
  gem.authors       = ["Chris Beer", "Justin Coyne", "Matt Zumwalt"]
  gem.email         = ["hydra-tech@googlegroups.com"]
  gem.description   = %q{Access controls for project hydra}
  gem.summary       = %q{Access controls for project hydra}
  gem.homepage      = "http://projecthydra.org"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "hydra-access-controls"
  gem.require_paths = ["lib"]
  gem.version       = version
  gem.license       = "APACHE2"

  gem.required_ruby_version = '>= 2.0.0'

  gem.add_dependency 'rails', '>= 5', '< 6'
  gem.add_dependency 'active-fedora', '>= 8.0.1', '< 8.7.0'
  gem.add_dependency "om", '~> 3.0', '>= 3.0.7'
  gem.add_dependency 'cancancan', '~> 1.16'
  gem.add_dependency 'deprecation', '~> 0.1'
  gem.add_dependency 'blacklight', '>= 6.19.0', '< 7.0.0'
  gem.add_dependency 'sass-rails', '~> 5.0'

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'bundler'
  gem.add_development_dependency 'rspec', '~> 3.8'
  gem.add_development_dependency 'rspec-its'
  gem.add_development_dependency 'rspec-mocks'
  gem.add_development_dependency 'rubocop-rspec'
  gem.add_development_dependency 'jettywrapper', '~> 1.8.0', '< 2'
  gem.add_development_dependency 'factory_bot'
end
