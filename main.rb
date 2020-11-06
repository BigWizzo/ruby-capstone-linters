file='lorem.css'
file_array = File.readlines(file)
bra_arr = []
bracket_hash = {}

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

# convert hash into a 2d array
hash_arr = bracket_hash.to_a

# Check line for missing brackets
 def check_bracket(arr)
   i = 0
   while i < arr.length
    j = 1
    while j < arr[i].length
      if !arr[i + 1].nil? && arr[i][1] == arr[i + 1][1]
        print "No matching bracket '#{arr[i][1]}': line #{arr[i + 1][0]}\n"
      end
      j += 1
    end
    i += 1
   end
 end
check_bracket(hash_arr)