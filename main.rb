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

# brackets into an array
def brackets_array(arr, bra_arr)
  i = 0
  while i < arr.length
    chec = arr[i].scan(/\{|\}/)
    if chec == ['{']
      bra_arr.push('{')
    elsif chec == ['}']
      bra_arr.push('}')
    end
    i += 1
  end
  bra_arr
end

brackets_array(file_array, bra_arr)

bra_string = bra_arr.join('')
brackets_array(file_array, bra_arr)
bra_arr.each do |x|
  # p bra_string
  p bra_string =~ /\{(?=\})/
end

# 

