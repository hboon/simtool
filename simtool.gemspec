# -*- encoding: utf-8 -*-
require File.expand_path('../lib/simtool/version.rb', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = 'simtool'
  gem.version       = SimTool::VERSION
  gem.licenses      = ['BSD']

  gem.authors  = ['Hwee-Boon Yar']

  gem.description = 'Import photos to iOS simulator.'
  gem.summary = 'Import photos to iOS simulator.'
  gem.homepage = 'http://hboon.com/ios-simtool/'
  gem.email = 'hboon@motionobj.com'

	gem.add_dependency 'commander', '~> 4.3'
  gem.files       = `git ls-files`.split($\)
  gem.executables   = ['simtool']
  gem.require_paths = ['lib']
  #gem.test_files  = gem.files.grep(%r{^spec/})
end
