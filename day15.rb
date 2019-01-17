def manDist(y1,x1,y2,x2)
    return (y2-y1).abs + (x2-x1).abs
end
def range(type, y,x, grid)
    inRange = []
    for i in 0...grid.length
        for j in 0...grid[i].length
            if type == "G"
                if grid[i][j] == "E"
                    if grid[i+1][j] == "."
                        inRange << [i+1,j,manDist(y,x,i+1,j)]
                    end
                    if grid[i-1][j] == "."
                        inRange << [i-1,j,manDist(y,x,i-1,j)]
                    end
                    if grid[i][j+1] == "."
                        inRange << [i,j+1,manDist(y,x,i,j+1)]
                    end
                    if grid[i][j-1] == "."
                        inRange << [i,j-1,manDist(y,x,i,j-1)]
                    end
                end
            elsif type == "E"
                if grid[i][j] == "G"
                    if grid[i+1][j] == "."
                        inRange << [i+1,j,manDist(y,x,i+1,j)]
                    end
                    if grid[i-1][j] == "."
                        inRange << [i-1,j,manDist(y,x,i-1,j)]
                    end
                    if grid[i][j+1] == "."
                        inRange << [i,j+1,manDist(y,x,i,j+1)]
                    end
                    if grid[i][j-1] == "."
                        inRange << [i,j-1,manDist(y,x,i,j-1)]
                    end
                end
            end
        end
    end
end
    def reachable(y1,x1,y2,x2,grid)

    end
    def chooseMove(type,y,x,grid)
        inRange = range(type,y,x,grid)
        dist = 2
        reachable = []
        found = false
        while inRange.length < 0
            inRange.each do |x|
                if x[2] == dist

                end
            end
            if found then break end
            dist += 1
        end
    end

def reachable(type,y,x,grid)
    inRange = range(type,y,x,grid)
    inRange.each do |x|
    end
end
def showGrid(grid)
    grid.each {|x| puts x}
    puts
end
file = File.open("day15.txt")
grid = []
while !file.eof?
    grid << file.readline
end
showGrid(grid)
#range1 = range("E", 1, 1, grid)
inrange = 
