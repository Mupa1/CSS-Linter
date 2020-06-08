require_relative '../lib/check_error.rb'

RSpec.describe ErrorChecker do
  let(:user_file) { File.open('stylesheet.css') }
  let(:file_data) { user_file.readlines }
  let(:error_checker) { ErrorChecker.new(file_data) }

  describe "#initialize" do
    context 'given required argument' do
      it "creates an instance of the ErrorChecker class" do
        expect(ErrorChecker.class).to eql(Class)
        expect(error_checker.file_data_arr).to eql(file_data)
      end
    end
    context 'missing argument' do
      it "does not create an instance of the ErrorChecker class" do
        expect { ErrorChecker.new }.to raise_error(ArgumentError)
      end
    end   
  end
end