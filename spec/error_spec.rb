require_relative '../lib/errors.rb'

RSpec.describe Errors do
  include Errors

  let(:data_index) { 1 }
  let(:correct_sample) { '  font-size: 2rem;' }

  describe '#missing_ending_semicolon?' do
    let(:file_data) { '  font-size: 2rem' }
    context 'has a semicolon at the end of a declaration' do
      it 'returns true' do
        expect(missing_ending_semicolon?(correct_sample, data_index)).to be true
      end
    end
    context 'missing a semicolon at the end of a declaration' do
      it 'does not return true' do
        expect(missing_ending_semicolon?(file_data, data_index)).not_to be true
      end
      it 'returns nil and it displays an error message' do
        expect(missing_ending_semicolon?(file_data, data_index)).to be nil
      end
    end
  end


end
