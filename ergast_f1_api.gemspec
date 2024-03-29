
lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ergast_f1_api/version'

Gem::Specification.new do |spec|
  spec.name          = 'ergast_f1_api'
  spec.version       = ErgastF1Api::VERSION
  spec.authors       = ['Daniel Comas']
  spec.email         = ['danieljcomas@gmail.com']

  spec.summary       = 'Ruby implementation to get historical from Ergast API.'
  spec.description   = 'Description will be done after.'
  spec.homepage      = 'https://github.com/danielcomas25/ergast_f1_api'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"

    spec.metadata['homepage_uri'] = spec.homepage
    spec.metadata['source_code_uri'] = 'https://github.com/danielcomas25/ergast_f1_api'
    spec.metadata['changelog_uri'] = 'https://github.com/danielcomas25/ergast_f1_api'
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.17'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_dependency 'bcrypt', '~> 3.1'
  spec.add_dependency 'faraday', '<= 0.15.4'
  spec.add_dependency 'faraday-cookie_jar'
  spec.add_dependency 'faraday_middleware'
  spec.add_dependency 'json'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.54.0'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'timecop'
  spec.add_development_dependency 'vcr'
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'yard'
end
