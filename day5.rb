def test(string,position)
    totest = string.slice(position,2)
    if totest[0].ord == totest[1].ord + 32 || totest[0].ord + 32 == totest[1].ord
        string.slice!(position,2)
        return true
    end
    return false
end
def operate(input)
    position = 0
    while position < input.length-1
        if test(input, position)
            position > 0 ? position -= 1 : position = 0
        else
            position += 1
        end
    end
    return input.length
end
file = File.open("day5.txt")
seed = String.new(file.read)

min = operate(String.new(seed))
puts min
for i in 65..90
    todelete = String.new()
    todelete << i.chr
    todelete << (i+32).chr
    val = operate(String.new(seed).delete(todelete))
    if val < min then min = val end
end
puts min