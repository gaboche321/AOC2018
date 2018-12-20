def printCoord(coord)
    puts "#{coord[0]},#{coord[1]}"
end
def level(map,x,y)
    flow = false
    loop do
        x -= 1
        if map[[x,y]] == "#"
            break
        end
        if map[[x,y+1]] == "#" && map[[x-1,y+1]] == "."
            flow = true
            break
        end
    end
    x += 1
    xleft = x
    loop do
        x += 1
        if map[[x,y]] == "#"
            break
        end
        if map[[x,y+1]] == "#" && map[[x+1,y+1]] == "."
            flow = true
            x += 2
            break
        end
    end
    xright = x-1
    if !flow
        for i in xleft..xright
            map[[i,y]] = "~"
        end
    else
        for i in xleft..xright
            map[[i,y]] = "|"
        end
    end
end
def waterflow(map, x = 500, y = 0)
    if map[[x,y]] == "."
        map[[x,y]] = "|"
    elsif map[[x+1,y]] == "|" || map[[x-1,y]] == "|"
        if 
    elsif map[[x,y]] == "|"
        waterflow(map,x,y+1)
    elsif map[[x,y]] == "#" || map[[x,y]] == "~"
        level(map,x,y-1)
    end
end
def minmaxXY(grid)
    maxX = 0
    maxY = 0
    minX = 1000
    minY = 100
    grid.each do |x,y|
        if x[0] > maxX
            maxX = x[0]
        end
        if x[1] > maxY
            maxY = x[1]
        end
        if x[0] < minX
            minX = x[0]
        end
        if x[1] < minY
            minY = x[1]
        end
    end
    return [minX, maxX, minY, maxY]
end
def printmap(map)
    borders = minmaxXY(map)
    for i in borders[2]..borders[3] + 1
        for j in borders[0]-1..borders[1] + 1
            print map[[j,i]]
        end
        puts
    end
    puts
end

file = File.open("day17.txt")
map = Hash.new(".")
while !file.eof?
    input = file.readline.delete(",").split(" ")
    if input[0][0] == "x"
        x = input[0].delete("x=").to_i
        range = input[1].delete("y=").squeeze(".").split(".")
        for i in range[0].to_i..range[1].to_i
            map[[x,i]] = "#"
        end
    else
        y = input[0].delete("y=").to_i
        range = input[1].delete("x=").squeeze(".").split(".")
        for i in range[0].to_i..range[1].to_i
            map[[i,y]] = "#"
        end
    end
end

printmap(map)
for i in 0...12
    waterflow(map)
end
printmap(map)