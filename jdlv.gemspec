# frozen_string_literal: true

require_relative 'lib/jdlv/version'

Gem::Specification.new do |spec|
  spec.name          = 'jdlv'
  spec.version       = Jdlv::VERSION
  spec.authors       = ['Antonio Hernández Blas']
  spec.email         = ['hba.nihilismus@gmail.com']

  spec.summary       = 'An implementation of Game of Life'
  spec.description   = 'Following an Object Oriented desing with unit tests and a command line interface.'
  spec.homepage      = 'https://github.com/nihilismus/jdlv'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
end
