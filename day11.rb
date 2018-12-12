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
def createGrid
    grid = Array.new(300) {Array.new(300,0)}
    for i in 0...300
        for j in 0...300
            grid[i][j] = computePower(j,i)
        end
    end
    return grid
end
def printGrid(grid)
    for i in 0...300
        for j in 0...300
            print "|#{grid[i][j]}"
        end
        puts
    end
end
def squareValue(x,y,grid,size)
    sum = 0
    for i in y...y+size
        for j in x...x+size
            sum += grid[i][j]
        end
    end
    return sum
end
def getmax(grid)
    max = -100
    maxpos = [0,0,0]
    for size in 0...14
        for i in 0..300-size
            for j in 0..300-size
                value = squareValue(j,i,grid,size)
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
grid = createGrid
#printGrid(grid)
getmax(grid)
