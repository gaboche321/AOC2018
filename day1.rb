file = File.open("day1.txt")
frequency = 0
log = {}
log[0] = true
changes = []
twice = 0
while !file.eof?
    input = file.readline.delete("+").to_i
    changes << input
    frequency += input
end
puts frequency
frequency = 0
found = false
while !found
    changes.each do |x|
        frequency += x
        test = frequency
        if log[test]
            puts frequency
            found = true
            break
        else
            log[test] = true
        end
    end
end

        

