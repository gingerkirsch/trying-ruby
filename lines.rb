i = 0
File.readlines("lines.txt").each do |line|
    if (line=~/dolor/)
        puts "#{i}: #{line}"
    end
    i = i + 1
end