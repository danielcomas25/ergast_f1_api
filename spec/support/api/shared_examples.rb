# frozen_string_literal: true

RSpec.shared_examples 'request in success' do
  it 'does not raise error' do
    expect { method }.not_to raise_error
  end
  it 'calls for building the models' do
    expect(model).to receive(:build).at_least(:once).with(any_args)
    method
  end
  it 'returns non empty instances' do
    expect(method.empty?).to eq(false)
  end
end

RSpec.shared_examples 'common methods' do
  describe '#all' do
    let(:method) { subject.all }
    it_behaves_like 'request in success'
  end

  describe '#by_id' do
    let(:method) { subject.by_id(id: id) }
    it_behaves_like 'request in success'
    it { expect(method.first.id).to eq(id) }
  end
end
