require_relative 'errors.rb'

class ErrorChecker
  include Errors
  attr_reader :file_data_arr

  def initialize(file_data_arr)
    @file_data_arr = file_data_arr
  end

  def display_error
    file_data_arr.each_with_index do |file_data, index|
      data_index = index + 1
      missing_ending_semicolon?(file_data, data_index)
    end
  end
end
