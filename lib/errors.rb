require 'colorize'

module Errors
  def missing_ending_semicolon?(file_data, data_index)
    if file_data.match?(/(;.*)$/) || file_data.match?(/({|})/) || file_data.match?(/^\n$/)
      true
    else
      puts 'Error: '.red + 'Missing ending semicolon ";" on' + " line:[:#{data_index}:]".yellow
    end
  end

  def space_before_semicolon?(file_data, data_index)
    return true unless file_data.match?(/( ;)+/)

    puts 'Error: '.red + 'Unexpected white space before semicolon " ;" on' + " line:[:#{data_index}:]".yellow
  end

  def indentation_error?(file_data, data_index)
    return true unless file_data.match?(/^\w+\s*-.\w*:/) || file_data.match?(/^\w+\s*\w*:/)

    puts 'Error: '.red + 'Expecting two spaced indentation on' + " line:[:#{data_index}:]".yellow
  end

  def space_after_colon?(file_data, data_index)
    return true unless file_data.match?(/(:\w+)/)

    puts 'Error: '.red + 'Expecting single space after colon ":") on' + " line:[:#{data_index}:]".yellow
  end

  def space_before_colon?(file_data, data_index)
    return true unless file_data.match?(/( :)/)

    puts 'Error: '.red + 'Unexpexted space before colon " :" on' + " line:[:#{data_index}:]".yellow
  end

  def trailing_white_space?(file_data, data_index)
    if !file_data.match?(/(?<=\S)[\t ]+$/) || file_data.match?(/^\n$/)
      true
    else
      puts 'Error: '.red + 'Trailing white spaces on' + " line:[:#{data_index}:]".yellow
    end
  end
end
