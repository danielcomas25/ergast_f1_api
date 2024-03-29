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

  let(:model) { ErgastF1Api::Models::Driver }
  let(:id) { 'alonso' }
  it_behaves_like 'common methods'

  describe '#by_season' do
    let(:method) { subject.by_season }
    it_behaves_like 'request in success'
  end

  describe '#by_team' do
    let(:team) { 'mclaren' }
    context 'for current season' do
      let(:method) { subject.by_team(team: team) }
      it_behaves_like 'request in success'
    end

    context 'for specific season' do
      let(:season) { '2000' }
      let(:method) { subject.by_team(team: team, season: season) }
      it_behaves_like 'request in success'
    end
  end

  describe '#by_nationality' do
    let(:nationality) { 'american' }
    let(:method) { subject.by_nationality(nationality: 'american') }
    it_behaves_like 'request in success'
    it 'returns americans' do
      expect(method.all? { |driver| driver.nationality == nationality.capitalize }).to eq(true)
    end
  end
end
