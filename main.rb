
require_relative './lint_process'

linter = LintProcess.new
file = linter.file
file_array = linter.file_array
bracket_hash = linter.bracket_hash
hash_arr = linter.hash_arr

# puts white space line
def trailing_white_space(arr)
  arr.each_with_index do |line_string, index|
    if line_string[-2] == " "
      puts "whitespace on line #{index + 1}"
    end
  end
end
trailing_white_space(file_array)

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

# Check for multiple brackets per line
def multi_brackets(arr, hash)
  arr.each_with_index do |line_string, index|
    if line_string.scan(/\{|\}/).length > 1
      puts "Multiple brackets detected on line: #{index + 1}"
    end
  end
end
multi_brackets(file_array, bracket_hash)

# Check if the colon is position at the end of the line
def last_colon(arr, hash)
  arr.each_with_index do |line_string, index|
    # p line_string.strip[-1]
    if line_string.scan(/\;/).length == 1 && line_string.strip[-1] != ';'
      puts "Semicolon error detected on line: #{index + 1}"
    end
  end
end
last_colon(file_array, bracket_hash)

# Check if the colon is position at the end of the line
def open_bracket(arr, hash)
  arr.each_with_index do |line_string, index|
    # p line_string.strip[-1]
    if line_string.scan(/\{/).length == 1 && line_string.strip[-1] != '{'
      puts "Opening Bracket error detected on line: #{index + 1}"
    end
  end
end
open_bracket(file_array, bracket_hash)

# Check if the colon is position at the end of the line
def open_bracket(arr, hash)
  arr.each_with_index do |line_string, index|
    if line_string.scan(/\}/).length == 1 && line_string.strip[0] != '}'
      puts "Closing Bracket error detected on line: #{index + 1}"
    end
  end
end
open_bracket(file_array, bracket_hash)

# Check for multiple semi-colons per line
def multi_colons(arr, hash)
  arr.each_with_index do |line_string, index|
    if line_string.scan(/\;/).length > 1
      puts "Multiple semi-colons detected on line: #{index + 1}"
    end
  end
end
multi_colons(file_array, bracket_hash)

# convert hash into a 2d array
hash_arr = bracket_hash.to_a

# Check line for missing brackets
 def check_bracket(arr)
   i = 0
   while i < arr.length
    j = 1
    while j < arr[i].length
      if !arr[i + 1].nil? && arr[i][1] == arr[i + 1][1]
        print "No matching bracket '#{arr[i][1]}': for line #{arr[i + 1][0]}\n"
      end
      j += 1
    end
    i += 1
   end
 end
check_bracket(hash_arr)
