def move(pos, dir, map)
    case dir
    when "W"
        pos[0] -= 1
        map[pos.clone] = "|"
        pos[0] -= 1
        map[pos.clone] = "."
    when "E"
        pos[0] += 1
        map[pos.clone] = "|"
        pos[0] += 1
        map[pos.clone] = "."
    when "S"
        pos[1] -= 1
        map[pos.clone] = "-"
        pos[1] -= 1
        map[pos.clone] = "."
    when "N"
        pos[1] += 1
        map[pos.clone] = "-"
        pos[1] += 1
        map[pos.clone] = "."
    end
    return pos
end
def dist(pos1,pos2)
    return (pos2[0]-pos1[0]).abs + (pos2[1]-pos1[1]).abs
end
def putPos(pos)
    print "#{pos[0]},#{pos[1]}\n"
end
def minmaxXY(grid)
    maxX = 0
    maxY = 0
    minX = 0
    minY = 0
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
def mapping(route, map)
    i = 1
    loop do
        if route[i] == "$" 
            puts route
            pos = [0,0]
            for j in 1...route.length - 1
                pos = move(pos,route[j], map)
            end
            return 0
        elsif route[i] == "("
            start = i.clone
            route.slice!(i)
            i += 1
            pars = 1
            split = []
            while pars > 0
                if route[i] == "("
                    pars += 1
                elsif route[i] == ")"
                    pars -= 1
                elsif route[i] == "|" && pars == 1
                    split = i.clone
                end
                i += 1
            end
            i -= 1
            route.slice!(i)
            path1 = route.clone
            path2 = route.clone
            path1.slice!(start, split-start+1)
            path2.slice!(split, i-split)
            mapping(path1, map)
            mapping(path2, map)
            break
        end
        i += 1
    end
end
file = File.open("day20.txt")
input = file.read

map = Hash.new("#")
map[[0,0]] = "X" 
mapping(input,map)
minmax = minmaxXY(map)

i = minmax[3] + 1
while i >= minmax[2] - 1
    for j in minmax[0]-1..minmax[1]+1
        print map[[j,i]]
    end
    puts
    i -= 1
end
