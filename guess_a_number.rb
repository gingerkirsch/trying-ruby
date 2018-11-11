num = rand(10)
puts "Enter the number from 0 to 10.."
input = gets.to_i
while (true)
  if (num == input)
      puts "match"
      break
  elsif (num < input)
      puts "try a smaller one"
      input = gets.to_i
  else
      puts "try a bigger one"
      input = gets.to_i
  end
end