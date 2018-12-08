class Coord
    attr_accessor :x, :y
    def initialize(x,y)
        @x = x
        @y = y
    end
    def eql?(other)
        return @x == other.x && @y == other.y
    end
    def hash
        return [@x, @y].hash
    end
    def manDist(other)
        return (@x-other.x).abs+(@y-other.y).abs
    end
    def put
        puts "#{@x}, #{@y}"
    end
end
class Area
    attr_accessor :id, :dist
    def initialize(id, dist)
        @id = id
        @dist = dist
    end
end
def areaTest(x,y,grid,id,dist)
    coord = Coord.new(x,y)
    if grid[coord] == nil
        grid[coord] = Area.new(id,dist)
    else
        if grid[coord].dist == dist
            grid[coord] = Area.new(0,0)
        end
    end
end
def populate(dist, centers, grid)
    centers.each do |x|
        areaTest(x.x,x.y-dist,grid,grid[x].id,dist)
        for i in -dist+1..dist-1
            xdist = dist - (i.abs)
            areaTest(x.x+xdist,x.y+i,grid,grid[x].id,dist)
            areaTest(x.x-xdist,x.y+i,grid,grid[x].id,dist)
        end
        areaTest(x.x,x.y+dist,grid,grid[x].id,dist)
    end
end
def printGrid(grid)
    for i in -500...500
        for j in 100...200
            coord = Coord.new(i,j)
            if grid[coord] == nil
                print "."
            else
                print grid[coord].id
            end
        end
        puts
    end
end
def cleanInf(grid)
    toDelete = Array.new
    for i in 0...500
        coord = Coord.new(i,0)
        coord2 = Coord.new(i,500)
        coord3 = Coord.new(0,i)
        coord4 = Coord.new(500,i)
        if grid[coord] != nil
            toDelete << grid[coord].id
        end
        if grid[coord2] != nil
            toDelete << grid[coord2].id
        end
        if grid[coord3] != nil
            toDelete << grid[coord3].id
        end
        if grid[coord4] != nil
            toDelete << grid[coord4].id
        end
    end
    toDelete.uniq!
    toDelete.sort!
    toDelete.each do |x|
        puts x
    end
    grid.delete_if {|x,y| toDelete.include?(y.id)}
    return toDelete
end
def maxArea(grid)
    deleted = cleanInf(grid)
    totest = []
    for i in 1..50
        if !deleted.include?(i)
            totest << i
        end
    end
    maxarea = 0
    maxid = 0
    totest.each do |x|
        sum = 0  
        grid.each_value do |y|
            if x == y.id
                sum += 1
            end
        end
        if sum > maxarea
            maxarea = sum
            maxid = x
        end
    end
    return maxarea
end


file = File.open("day6.txt")
centers = Array.new
while !file.eof?
    input = file.readline.delete(",").split(" ")
    centers << Coord.new(input[0].to_i, input[1].to_i)
end
grid = Hash.new
i = 1
centers.each do |x|
    grid[x] = Area.new(i, 0)
    i += 1
end
begin
for i in 1...300
    populate(i,centers,grid)
end

puts maxArea(grid)
end
grid = Hash.new()
i = 1
centers.each do |x|
    grid[x] = Area.new(i, 0)
    i += 1
end
sum = 0
for i in 0...500
    for j in 0...500
        sumdist = 0
        coord = Coord.new(i,j)
        centers.each do |x|
            sumdist += x.manDist(coord)
        end
        if sumdist < 10000
            grid[coord] = Area.new("#",sumdist)
            sum += 1
        end
    end
end
puts sum
#TEST
