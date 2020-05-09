# frozen_string_literal: true

require 'spec_helper'
require 'ergast_f1_api/api/client'
require 'ergast_f1_api/api/exceptions/errors'

RSpec.describe ErgastF1Api::Api::Circuit do
  let(:subject) { described_class.new(client: client) }
  let(:client) { ErgastF1Api::Api::Client.new }

  around(:example) do |example|
    VCR.use_cassette('ergast_f1_api/circuit', &example)
  end
  let(:model) { ErgastF1Api::Models::Circuit }
  let(:id) { 'albert_park' }
  it_behaves_like 'common methods'

  describe '#by_season' do
    let(:method) { subject.by_season }
    it_behaves_like 'request in success'
  end

  describe '#by_country' do
    let(:country) { 'france' }
    let(:method) { subject.by_country(country: country) }
    it_behaves_like 'request in success'
    it 'returns the given country' do
      expect(method.all? { |circuit| circuit.location.country == country.capitalize }).to eq(true)
    end
  end
end
