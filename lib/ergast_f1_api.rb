require 'ergast_f1_api/version'
require 'faraday'
require 'ergast_f1_api/api/client'
require 'ergast_f1_api/api/driver'
require 'ergast_f1_api/api/constructor'
require 'ergast_f1_api/api/circuit'
require 'ergast_f1_api/api/exceptions/errors'

module ErgastF1Api
  class Error < StandardError; end
end
