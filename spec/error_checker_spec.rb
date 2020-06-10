require_relative '../lib/error_checker.rb'

RSpec.describe ErrorChecker do
  let(:user_file2) { File.open('stylesheet_copy.css') }
  let(:file_data2) { user_file2.readlines }
  let(:error_checker2) { ErrorChecker.new(file_data2) }

  describe '#initialize' do
    it 'creates an instance of the ErrorChecker class' do
      expect(ErrorChecker.class).to eql(Class)
      expect(error_checker2.file_data_arr).to eql(file_data2)
    end
    it 'raises an argument error if argument is missing' do
      expect { ErrorChecker.new }.to raise_error(ArgumentError)
    end
  end

  describe '#display_error' do
    it "displays a message 'No Errors Found' if user's file has no errors" do
      expect { error_checker2.display_error }.to output(String).to_stdout
    end
  end
end
