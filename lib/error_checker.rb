require_relative 'errors.rb'

class ErrorChecker
  include Errors
  attr_reader :file_data_arr

  def initialize(file_data_arr)
    @file_data_arr = file_data_arr
  end

  # rubocop: disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
  def display_error
    counter = 0
    file_data_arr.each_with_index do |file_data, index|
      data_index = index + 1
      counter += 1 unless missing_ending_semicolon?(file_data, data_index)
      counter += 1 unless space_before_semicolon?(file_data, data_index)
      counter += 1 unless indentation_error?(file_data, data_index)
      counter += 1 unless space_after_colon?(file_data, data_index)
      counter += 1 unless space_before_colon?(file_data, data_index)
      counter += 1 unless trailing_white_space?(file_data, data_index)
    end
    puts 'No Errors Found'.green if counter.zero?
  end
  # rubocop: enable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
end
