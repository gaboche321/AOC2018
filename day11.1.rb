$serial = 6392
def computePower(j,i)
    rackID = j + 11
    power = (i+1) * rackID
    power += $serial
    power *= rackID
        if power < 100
            power = 0
        else
            string = power.to_s
            power = string[string.length-3].to_i
        end
    power -= 5
    return power
end
def squareValue(x,y,size)
    sum = 0
    for i in y...y+size
        for j in x...x+size
            sum += computePower(j,i)
        end
    end
    return sum
end
def getmax
    max = -100
    maxpos = [0,0,0]
    for size in 1...14
        puts size
        for i in 0..300-size
            for j in 0..300-size
                value = squareValue(j,i,size)
                if value > max
                    max = value
                    maxpos = [(j+1), (i+1), size]
                    #puts "newmax : #{max}"
                end
            end
        end
    end
    puts max
    puts maxpos.join(",")
end
serial = 18
getmax
