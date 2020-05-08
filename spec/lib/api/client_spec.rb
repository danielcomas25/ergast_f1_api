# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ErgastF1Api::Api::Client do
  let(:subject) { described_class.new }

  around(:example) do |example|
    VCR.use_cassette('ergast_f1_api/client', &example)
  end

  describe '#get' do
    it 'reponse 200' do
      expect { subject.get('drivers.json?limit=1') }.not_to raise_error
    end
  end
end
