class Point
    attr_reader :mindist, :px, :py
    def initialize(px,py,vx=0,vy=0)
        @px = px
        @py = py
        @vx = vx
        @vy = vy
        @mindist = @px.abs + @py.abs
    end
    def eql?(other)
        return @px == other.px && @py == other.py
    end
    def hash
        return [@px, @py].hash
    end
    def dist
        #puts @px 
        #puts @py
        return @px.abs + @py.abs
    end
    def printPos
        puts "#{@px}, #{@py}"
    end
    def update
        @px += @vx
        @py += @vy
        if self.dist < @mindist
            @mindist = self.dist
        end
    end
end
def printGrid(start, size, grid)
    for i in 150...162
        for j in 112...size
            if grid[Point.new(j,i)]
                print "#"
            else
                print " "
            end
        end
        puts
    end
end
file = File.open("day10.txt")
points = Array.new
while !file.eof?
    input = file.readline.delete("position=velocity<>,").split(" ")
    points << Point.new(input[0].to_i,input[1].to_i,input[2].to_i,input[3].to_i)
end
i = 0
while i < 10036
    flag = true
    #puts points[0].dist
    points.each do |x|
        x.update
        if x.dist > 400
            flag = false
        end
    end
    i += 1
end
grid = Hash.new
points.each do |x|
    grid[x] = true
end

printGrid(100, 200, grid)
puts i
