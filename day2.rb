file = File.open("day2.txt")
twice = 0
thrice = 0
strings = Array.new
while !file.eof?
    input = file.readline
    input.each_char do |x|
        if input.count(x) == 2
            twice += 1
            break
        end
    end
    input.each_char do |x|
        if input.count(x) == 3
            thrice += 1
            break
        end
    end
    strings << String.new(input)
end
puts twice * thrice

found = false
strings.each do |x|
    strings.each do |y|
        count = 0
        for i in 0...x.length
            if x[i] == y[i]
                count += 1
            end
        end
        if count == x.length - 1
            puts x.slice(y)
            found = true
        end
        if found then break end
    end
    if found then break end
end
