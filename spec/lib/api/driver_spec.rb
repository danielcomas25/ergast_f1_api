# frozen_string_literal: true

require 'spec_helper'
require 'ergast_f1_api/api/client'
require 'ergast_f1_api/api/exceptions/errors'

RSpec.describe ErgastF1Api::Api::Driver do
  let(:subject) { described_class.new(client: client) }
  let(:client) { ErgastF1Api::Api::Client.new }

  around(:example) do |example|
    VCR.use_cassette('ergast_f1_api/driver', &example)
  end

  shared_examples 'request in success' do
    it 'does not raise error' do
      expect { method }.not_to raise_error
    end
    it 'builds models' do
      expect(method.empty?).to eq(false)
    end
  end

  describe '#all' do
    let(:method) { subject.all }
    it_behaves_like 'request in success'
  end

  describe '#by_id' do
    let(:id) { 'alonso' }
    let(:method) { subject.by_id(id: id) }
    it_behaves_like 'request in success'
  end

  describe '#by_season' do
    let(:method) { subject.by_season }
    it_behaves_like 'request in success'
  end

  describe '#by_team' do
    let(:team) { 'mclaren' }
    let(:method) { subject.by_team(team: 'mclaren') }
    it_behaves_like 'request in success'
  end
end
