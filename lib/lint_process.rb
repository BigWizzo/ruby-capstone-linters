# LintProces class initializing the file
class LintProcess
  attr_reader :file, :file_array, :bracket_hash, :errors

  def initialize
    @file = 'lorem.css'
    @file_array = File.readlines(file)
    @bracket_hash = {}
    @errors = {}
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
          @errors.store("#{hash_arr[i + 1][0]}", "No matching bracket '#{hash_arr[i][1]}")
        end
        j += 1
      end
      i += 1
    end
    @errors
  end

  def check_error
    file_array.each_with_index do |line_string, index|
      if line_string[-2] == ' '
        @errors.store("#{index + 1}", "Trailing whitespace detected")
      elsif line_string.scan(/\{|\}/).length > 1
        @errors.store("#{index + 1}", "Multiple brackets detected")
      elsif line_string.scan(/\;/).length == 1 && line_string.strip[-1] != ';'
        @errors.store("#{index + 1}", "Semicolon error detected")
      elsif line_string.scan(/\{/).length == 1 && line_string.strip[-1] != '{'
        @errors.store("#{index + 1}", "Opening Bracket error detected")
      elsif line_string.scan(/\}/).length == 1 && line_string.strip[0] != '}'
        @errors.store("#{index + 1}", "Closing Bracket error detected")
      elsif line_string.scan(/\;/).length > 1
        @errors.store("#{index + 1}", "Multiple semi-colons detected")
      end
    end
    @errors
  end
end
