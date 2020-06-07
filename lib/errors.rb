require 'colorize'

module Errors
  def missing_ending_semicolon?(file_data, data_index)
    if file_data.match?(/(;.*)$/) || file_data.match?(/({|})/) || file_data.match?(/^\n$/)
      true
    else
      puts 'Error: '.red + 'Missing ending semicolon ";" on' + " line:[:#{data_index}:]".yellow
    end
  end
end
