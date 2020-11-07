
require_relative '../lib/lint_process'

linter = LintProcess.new
file = linter.file
file_array = linter.file_array
bracket_hash = linter.bracket_hash
hash_arr = linter.hash_arr

# return hash of bracets and lines
def bracket_line(arr, hash)
  arr.each_with_index do |line_string, index|
    chec = line_string.scan(/\{|\}/)
      if chec == ['{']
        hash[index + 1] = '{'
      elsif chec == ['}']
        hash[index + 1] = '}'
      end
  end
  hash
end
bracket_line(file_array, bracket_hash)

hash_arr = bracket_hash.to_a
def check_bracket(arr)
  i = 0
  while i < arr.length
   j = 1
   while j < arr[i].length
     if !arr[i + 1].nil? && arr[i][1] == arr[i + 1][1]
       puts "No matching bracket '#{arr[i][1]}' : line #{arr[i + 1][0]}\n"
     end
     j += 1
   end
   i += 1
  end
end
check_bracket(hash_arr)

if __FILE__ == $PROGRAM_NAME
# Check for multiple brackets per line
def check_error(arr, hash)
  arr.each_with_index do |line_string, index|
    if line_string[-2] == " "
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
check_error(file_array, bracket_hash)
end
