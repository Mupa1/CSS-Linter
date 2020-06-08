require_relative '../lib/check_error.rb'

RSpec.describe ErrorChecker do
  let(:user_file) { File.open('stylesheet.css') }
  let(:file_data) { user_file.readlines }
  let(:error_checker) { ErrorChecker.new(file_data) }

  describe '#initialize' do
    context 'given required argument' do
      it 'creates an instance of the ErrorChecker class' do
        expect(ErrorChecker.class).to eql(Class)
        expect(error_checker.file_data_arr).to eql(file_data)
      end
    end
    context 'missing argument' do
      it 'does not create an instance of the ErrorChecker class' do
        expect { ErrorChecker.new }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#display_error' do
    context 'when the given file has errors' do
      it 'it shows error messages and does not return true' do
        expect(error_checker.display_error).not_to eql(true)
      end
    end
    context 'when the given file does not have errors' do
      let(:user_file2) { File.open('stylesheet_copy.css') }
      let(:file_data2) { user_file2.readlines }
      let(:error_checker2) { ErrorChecker.new(file_data2) }
      it "returns nil and displays a message 'No Errors Found'" do
        expect(error_checker2.display_error).to eql(nil)
      end
    end
  end
end
