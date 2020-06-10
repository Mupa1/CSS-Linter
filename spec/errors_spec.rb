require_relative '../lib/errors.rb'

RSpec.describe Errors do
  include Errors

  let(:data_index) { 1 }
  let(:correct_sample) { '  font-size: 2rem;' }

  describe '#missing_ending_semicolon?' do
    let(:file_data) { '  font-size: 2rem' }
    it 'returns true if there is a semicolon at the end of a declaration' do
      expect(missing_ending_semicolon?(correct_sample, data_index)).to be true
    end
    it 'prints error message if semicolon is missing' do
      expect { missing_ending_semicolon?(file_data, data_index) }.to output(String).to_stdout
    end
  end

  describe '#space_before_semicolon?' do
    let(:file_data) { '  font-size: 2rem ;' }
    it 'returns true if there is no space before the semicolon' do
      expect(space_before_semicolon?(correct_sample, data_index)).to be true
    end
    it 'prints error message if there is a space before the semicolon' do
      expect { space_before_semicolon?(file_data, data_index) }.to output(String).to_stdout
    end
  end

  describe '#indentation_error?' do
    let(:file_data) { 'font-size: 2rem;' }
    it 'returns true if it has two spaced indentation before the declaration' do
      expect(indentation_error?(correct_sample, data_index)).to be true
    end
    it 'prints error message if no indentation before the declaration' do
      expect { indentation_error?(file_data, data_index) }.to output(String).to_stdout
    end
  end

  describe '#space_after_colon?' do
    let(:file_data) { '  font-size:2rem;' }
    it 'returns true if there is a single space after the colon' do
      expect(space_after_colon?(correct_sample, data_index)).to be true
    end
    it 'prints error message if there is no space after the colon' do
      expect { space_after_colon?(file_data, data_index) }.to output(String).to_stdout
    end
  end

  describe '#space_before_colon?' do
    let(:file_data) { '  font-size : 2rem;' }
    it 'returns true if there is no space before the colon on the declaration' do
      expect(space_before_colon?(correct_sample, data_index)).to be true
    end
    it 'prints error message if there is a space before the colon' do
      expect { space_before_colon?(file_data, data_index) }.to output(String).to_stdout
    end
  end

  describe '#trailing_white_space?' do
    let(:file_data) { '  font-size: 2rem;    ' }
    it 'returns true if there is no trailing white spaces after the declaration' do
      expect(trailing_white_space?(correct_sample, data_index)).to be true
    end
    it 'prints error message if there is trailing white spaces after the declaration' do
      expect { trailing_white_space?(file_data, data_index) }.to output(String).to_stdout
    end
  end
end
