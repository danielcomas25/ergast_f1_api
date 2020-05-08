require 'bundler/setup'
require 'ergast_f1_api'
require 'simplecov'
require 'vcr'
require 'yaml'
require 'pry'
require 'vcr_setup'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Add shared_examples
  Dir['./spec/support/**/*.rb'].sort.each { |f| require f }

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
