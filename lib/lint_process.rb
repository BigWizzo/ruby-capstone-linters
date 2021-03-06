# rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
# LintProces class initializing the file
class LintProcess
  attr_accessor :file, :file_array, :bracket_hash, :errors

  def initialize(file)
    @file = file
    @file_array = File.readlines(file)
    @bracket_hash = {}
    @errors = {}
  end

  private

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

  public

  def check_bracket
    bracket_line
    hash_arr = @bracket_hash.to_a
    i = 0
    while i < hash_arr.length
      j = 0
      while j < hash_arr[i].length
        if !hash_arr[i + 1].nil? && hash_arr[i][1] == hash_arr[i + 1][1]
          @errors.store((hash_arr[i + 1][0]).to_s,
                        "No matching bracket '#{hash_arr[i][1]}'")
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
        @errors.store((index + 1).to_s, 'Trailing whitespace detected')
      elsif line_string.scan(/\{|\}/).length > 1
        @errors.store((index + 1).to_s, 'Multiple brackets detected')
      elsif line_string.scan(/\;/).length == 1 && line_string.strip[-1] != ';'
        @errors.store((index + 1).to_s, 'Semicolon error detected')
      elsif line_string.scan(/\{/).length == 1 && line_string.strip[-1] != '{'
        @errors.store((index + 1).to_s, 'Opening Bracket error detected')
      elsif line_string.scan(/\}/).length == 1 && line_string.strip[0] != '}'
        @errors.store((index + 1).to_s, 'Closing Bracket error detected')
      elsif line_string.scan(/\;/).length > 1
        @errors.store((index + 1).to_s, 'Multiple semi-colons detected')
      end
    end
    @errors
  end
end

# rubocop:enable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
