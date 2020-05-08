# frozen_string_literal: true

require 'spec_helper'
require 'ergast_f1_api/api/exceptions/errors'

RSpec.describe ErgastF1Api::Api::Client do
  let(:subject) { described_class.new }

  around(:example) do |example|
    VCR.use_cassette('ergast_f1_api/client', &example)
  end

  let(:params) { { url: url } }

  describe '#get' do
    context 'when response is 200' do
      let(:url) { 'drivers.json?limit=1' }
      it { expect { subject.get(params) }.not_to raise_error }
    end

    context 'when response is 40X' do
      let(:url) { 'drivrs.json?limit=1' }
      it { expect { subject.get(params) }.to raise_error(ErgastF1Api::Api::Exceptions::ClientError) }
    end

    context 'when response is 50X' do
      let(:url) { 'drivers.json?limit=2' }
      it { expect { subject.get(params) }.to raise_error(ErgastF1Api::Api::Exceptions::ServerError) }
    end

    context 'when response is 1XX' do
      let(:url) { 'drivers.json?limit=3' }
      it { expect { subject.get(params) }.to raise_error(ErgastF1Api::Api::Exceptions::UnknownError) }
    end
  end
end
