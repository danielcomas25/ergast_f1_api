# frozen_string_literal: true

require 'vcr'

VCR.configure do |c|
  c.default_cassette_options = {
    record: :new_episodes,
    match_requests_on: %i[method uri]
  }
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.allow_http_connections_when_no_cassette = true
  c.hook_into :faraday, :webmock
end
