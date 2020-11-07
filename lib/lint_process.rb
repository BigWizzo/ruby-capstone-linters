# LintProces class initializing the file
class LintProcess
  attr_reader :file, :file_array, :bracket_hash

  def initialize
    @file = 'lorem.css'
    @file_array = File.readlines(file)
    @bracket_hash = {}
  end

  def bracket_line
    @file_array.each_with_index do |line_string, index|
      chec = line_string.scan(/\{|\}/)
      if chec == ['{']
        @bracket_hash[index + 1] = '{'
      elsif chec == ['}']
        @bracket_hash[index + 1] = '}'
      end
    end
    @bracket_hash
  end
    
  def check_bracket
    hash_arr = @bracket_hash.to_a
    i = 0
    while i < hash_arr.length
      j = 1
      while j < hash_arr[i].length
        if !hash_arr[i + 1].nil? && hash_arr[i][1] == hash_arr[i + 1][1]
          puts "No matching bracket '#{hash_arr[i][1]}' : line #{hash_arr[i + 1][0]}\n"
        end
        j += 1
      end
      i += 1
    end
  end

  def check_error
    file_array.each_with_index do |line_string, index|
      if line_string[-2] == ' '
        puts "Trailing whitespace detected: line #{index + 1}"
      elsif line_string.scan(/\{|\}/).length > 1
        puts "Multiple brackets detected: line #{index + 1}"
      elsif line_string.scan(/\;/).length == 1 && line_string.strip[-1] != ';'
        puts "Semicolon error detected: line #{index + 1}"
      elsif line_string.scan(/\{/).length == 1 && line_string.strip[-1] != '{'
        puts "Opening Bracket error detected: line #{index + 1}"
      elsif line_string.scan(/\}/).length == 1 && line_string.strip[0] != '}'
        puts "Closing Bracket error detected: line #{index + 1}"
      elsif line_string.scan(/\;/).length > 1
        puts "Multiple semi-colons detected: line #{index + 1}"
      end
    end
  end
end

linter = LintProcess.new
linter.bracket_line
linter.check_bracket
linter.check_error

