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

  describe '#space_before_semicolon?' do
    let(:file_data) { '  font-size: 2rem ;' }
    context 'has no space before the semicolon at the end of a declaration' do
      it 'returns true' do
        expect(space_before_semicolon?(correct_sample, data_index)).to be true
      end
    end
    context 'has a space before the semicolon at the end of a declaration' do
      it 'does not return true' do
        expect(space_before_semicolon?(file_data, data_index)).not_to be true
      end
      it 'returns nil and displays an error message' do
        expect(space_before_semicolon?(file_data, data_index)).to be nil
      end
    end
  end

  describe '#indentation_error?' do
    let(:file_data) { 'font-size: 2rem;' }
    context 'has two spaced indentation before the declaration' do
      it 'returns true' do
        expect(indentation_error?(correct_sample, data_index)).to be true
      end
    end
    context 'has no indentation before the declaration' do
      it 'does not return true' do
        expect(indentation_error?(file_data, data_index)).not_to be true
      end
      it 'returns nil and displays an error message' do
        expect(indentation_error?(file_data, data_index)).to be nil
      end
    end
  end

  describe '#space_after_colon?' do
    let(:file_data) { '  font-size:2rem;' }
    context 'has a single space after the colon on the declaration' do
      it 'returns true' do
        expect(space_after_colon?(correct_sample, data_index)).to be true
      end
    end
    context 'has no space after the colon on the declaration' do
      it 'does not return true' do
        expect(space_after_colon?(file_data, data_index)).not_to be true
      end
      it 'returns nil and displays an error message' do
        expect(space_after_colon?(file_data, data_index)).to be nil
      end
    end
  end

  describe '#space_before_colon?' do
    let(:file_data) { '  font-size : 2rem;' }
    context 'has no space before the colon on the declaration' do
      it 'returns true' do
        expect(space_before_colon?(correct_sample, data_index)).to be true
      end
    end
    context 'has a space before the colon on the declaration' do
      it 'does not return true' do
        expect(space_before_colon?(file_data, data_index)).not_to be true
      end
      it 'returns nil and displays an error message' do
        expect(space_before_colon?(file_data, data_index)).to be nil
      end
    end
  end

end
