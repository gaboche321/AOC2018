def createRectangle(grid,x,y,dx,dy)
    for i in y...y+dy
        for j in x...x+dx
            grid[i][j] += 1
        end
    end
end
def testRectangle(grid,x,y,dx,dy)
    for i in y...y+dy
        for j in x...x+dx
            if grid[i][j] != 1
                return false
                break
            end
        end
    end
    return true
end

file = File.open("day3.txt")
grid = Array.new(1000) {Array.new(1000, 0)}
while !file.eof?
    input = file.readline.delete!("#@:").split(" ")
    position = input[1].split(",")
    size = input[2].split("x")
    createRectangle(grid, position[0].to_i, position[1].to_i, size[0].to_i, size[1].to_i)
end
count = 0
grid.each do |x|
    x.each do |y|
        if y >= 2 then count += 1 end
    end
end
puts count
file.rewind
while !file.eof?
    input = file.readline.delete!("#@:").split(" ")
    position = input[1].split(",")
    size = input[2].split("x")
    if testRectangle(grid, position[0].to_i, position[1].to_i, size[0].to_i, size[1].to_i)
        puts input[0]
        break
    end
end