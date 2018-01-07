require 'spec_helper'

describe Nem::Unit::Version do
  let(:network) { 0x68000000 }
  let(:version) { 0x00000001 }
  let(:value) { network | version }

  subject { described_class.new(value) }

  context 'mainnet' do
    describe '#mainnet?' do
      it { expect(subject.mainnet?).to eq true }
    end

    describe '#to_s' do
      it { expect(subject.to_s).to eq 'mainnet' }
    end
  end

  context 'testnet' do
    let(:network) { 0x98000000 }

    describe '#testnet?' do
      it { expect(subject.testnet?).to eq true }
    end

    describe '#to_s' do
      it { expect(subject.to_s).to eq 'testnet' }
    end
  end

  context 'mijin' do
    let(:network) { 0x60000000 }
    describe '#mijin?' do
      it { expect(subject.mijin?).to eq true }
    end

    describe '#to_s' do
      it { expect(subject.to_s).to eq 'mijin' }
    end
  end

  describe '#to_i' do
    it { expect(subject.to_i).to eq value }
  end
end
