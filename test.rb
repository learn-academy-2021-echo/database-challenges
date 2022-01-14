# def check_if_panlidrome(string_param)
#   if string_param == string_param.reverse
#     puts "#{string_param} is a panlidrome."
#     else
#     puts "#{string_param} is not a panlidrome."
#   end
# end
#
# check_if_panlidrome('hannah')
# def palindrome (string)
#     if string.downcase == string.reverse.downcase
#        p "#{string} is a palindrome."
#     else
#        p "#{string} is not a palindrome."
#     end
# end
#
# palindrome('hannah')
def print_middle_ltrs(word_param)
  array = word_param.split('')
  if array.length % 2 == 1
    puts "letter '#{word_param}'  has odd numbers of letters."
    p "the middle letter is #{array[array.length/2]}"
    else
    puts "letter '#{word_param}' has even numbers of letters."
    p "the middle letters are #{array[(array.length/2)-1]} and #{array[array.length/2]} "
  end
end

print_middle_ltrs('jason')
print_middle_ltrs('kirk')
