def update(surroundings, piece)
    case piece
    when "."
        return surroundings.count("|") >= 3 ? "|" : "."
    when "|"
        return surroundings.count("#") >= 3 ? "#" : "|"
    when "#" 
        return surroundings.count("#") >= 1 && surroundings.count("|") >= 1 ? "#" : "."
    end
end
def getsurroundings(y,x,map)
    surroundings = []
    if x > 0 && y > 0 && y < map.length - 1 && x < map[y].length - 1
        surroundings << map[y-1][x+1]
        surroundings << map[y][x+1]
        surroundings << map[y+1][x+1]
        surroundings << map[y-1][x-1]
        surroundings << map[y][x-1]
        surroundings << map[y+1][x-1]
        surroundings << map[y-1][x]
        surroundings << map[y+1][x]
    elsif y == 0 && x > 0 && x < map[y].length - 1
        surroundings << map[y][x+1]
        surroundings << map[y+1][x+1]
        surroundings << map[y][x-1]
        surroundings << map[y+1][x-1]
        surroundings << map[y+1][x]
    elsif y == map.length - 1 && x > 0 && x < map[y].length - 1
        surroundings << map[y][x+1]
        surroundings << map[y-1][x+1]
        surroundings << map[y][x-1]
        surroundings << map[y-1][x-1]
        surroundings << map[y-1][x]
    elsif x == 0 && y > 0 && y < map.length - 1
        surroundings << map[y-1][x+1]
        surroundings << map[y][x+1]
        surroundings << map[y+1][x+1]
        surroundings << map[y-1][x]
        surroundings << map[y+1][x]
    elsif x == map[y].length - 1 && y > 0 && y < map.length - 1
        surroundings << map[y-1][x-1]
        surroundings << map[y][x-1]
        surroundings << map[y+1][x-1]
        surroundings << map[y-1][x]
        surroundings << map[y+1][x]
    elsif y == 0 && x == 0
        surroundings << map[0][1]
        surroundings << map[1][1]
        surroundings << map[1][0]
    elsif y == 0 && x == map[y].length - 1
        surroundings << map[1][x]
        surroundings << map[1][x-1]
        surroundings << map[0][x-1]
    elsif y == map.length - 1 && x == 0
        surroundings << map[y-1][0]
        surroundings << map[y-1][1]
        surroundings << map[y][1]
    elsif y == map.length - 1 && x == map[y].length - 1
        surroundings << map[y-1][x]
        surroundings << map[y-1][x-1]
        surroundings << map[y][x-1]
    end
    return surroundings
end
def minute(map)
    newmap = []
    for i in 0...map.length
        newmap << String.new
        for j in 0...map[i].length
            surroundings = getsurroundings(i,j,map)
            newmap.last << update(surroundings,map[i][j])
        end
    end
    return newmap
end
def parseInput
    file = File.open("day18.txt")
    map = Array.new
    while !file.eof?
        map << file.readline.chomp
    end
    return map
end
def printmap(map)
    map.each do |x|
        puts x
    end
    puts
end


map = parseInput
lastval = 0

for i in 0...10000
    lumber = 0
    tree = 0
    map = minute(map)
    map.each do |x|
        lumber += x.count("#")
        tree += x.count("|")
    end
    newval = lumber*tree
    puts "#{i}\t#{newval-lastval}"
    lastval = newval
    if i > 494
        puts lumber*tree
    end
    if i == 500
        break
    end
end


#printmap(map)
puts lumber * tree