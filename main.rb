file='lorem.css'
file_array = File.readlines(file)
bra_arr = []

def trailing_white_space(arr)
  arr.each_with_index do |line_string, index|
    if line_string[-2] == " "
      puts "whitespace on line #{index + 1}"
    end
  end
end

trailing_white_space(file_array)

file_array.each_with_index do |line_string, index|
  chec = line_string.scan(/\{|\}/)
  "#{chec} => #{index + 1}"
  your_hash = {}
  if chec == ['{']
    bra_arr.push('{')
  elsif chec == ['}']
    bra_arr.push('}')
  end
  # puts your_hash
end
# p bra_arr
your_hash = {}

# return hash of bracets
file_array.each_with_index do |line_string, index|
  chec = line_string.scan(/\{|\}/)
    if chec == ['{']
      your_hash[index + 1] = '{'
    elsif chec == ['}']
      your_hash[index + 1] = '}'
    end
end
# puts your_hash

#  your_hash_arr_values = your_hash.values
#  your_hash_arr_keys = your_hash.keys

 hash_arr = your_hash.to_a
 print hash_arr

 i = 0
 while i < hash_arr.length
  j = 1
  while j < hash_arr[i].length
    if !hash_arr[i + 1].nil? && hash_arr[i][1] == hash_arr[i + 1][1]
     print "No matching bracket '#{hash_arr[i][1]}': line #{hash_arr[i + 1][0]}\n"
    end
    j += 1
  end
  i += 1
 end
