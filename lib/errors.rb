require 'colorize'

module Errors
  def missing_ending_semicolon?(file_data, data_index)
    if file_data.match?(/(;.*)$/) || file_data.match?(/({|})/) || file_data.match?(/^\n$/)
      true
    else
      puts 'Error: '.red + 'Missing ending semicolon ";" on' + " line:[:#{data_index}:]".yellow
    end
  end

  def indentation_error?(file_data, data_index)
    return unless file_data.match?(/^\w+\s*\w*:/)

    puts 'Error: '.red + 'Expecting two spaced indentation on' + " line:[:#{data_index}:]".yellow
  end
end
