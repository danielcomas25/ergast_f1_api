require "bundler/setup"
require "ergast_f1_api"
require 'simplecov'
require 'vcr'
require 'yaml'
require 'pry'
require 'ergast_f1_api'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
