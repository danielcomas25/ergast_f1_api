# frozen_string_literal: true

require 'spec_helper'
require 'ergast_f1_api/api/client'
require 'ergast_f1_api/api/exceptions/errors'

RSpec.describe ErgastF1Api::Api::Constructor do
  let(:subject) { described_class.new(client: client) }
  let(:client) { ErgastF1Api::Api::Client.new }

  around(:example) do |example|
    VCR.use_cassette('ergast_f1_api/constructor', &example)
  end
  let(:model) { ErgastF1Api::Models::Constructor }
  let(:id) { 'alfa' }
  it_behaves_like 'common methods'

  describe '#by_season' do
    let(:method) { subject.by_season }
    it_behaves_like 'request in success'
  end

  describe '#by_nationality' do
    let(:nationality) { 'american' }
    let(:method) { subject.by_nationality(nationality: 'american') }
    it_behaves_like 'request in success'
    it 'returns americans' do
      expect(method.all? { |constructor| constructor.nationality == nationality.capitalize }).to eq(true)
    end
  end
end
