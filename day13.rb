class Cart
    attr_reader :x, :y
    def initialize(x,y, dir)
        @x = x
        @y = y
        case dir
        when "<"
            @dir = 2
        when ">"
            @dir = 0
        when "^"
            @dir = 1
        when "v"
            @dir = 3
        end
        @next = 1
    end
    def <=>(other)
        if @x == other.x && @y == other.y
            return 0
        elsif @y < other.y
            return -1
        elsif @y == other.y && @x < other.x 
            return -1
        else 
            return 1
        end
    end
    def eql?(other)
        if @x == other.x && @y == other.y
            return true
        else
            return false
        end
    end
    alias == eql?
    def getPos
        return[@x,@y]
    end
    def left
        @dir += 1
        @dir %= 4
    end
    def right
        @dir -= 1
        if @dir == -1
            @dir = 3
        end
    end
    def crossroad
        if @next == 1
            self.left
        elsif @next == -1
            self.right
            @next = 2
        end
        @next -= 1
    end
    def turn(curve)
        if @dir == 0
            if curve == "/"
                self.left
            else
                self.right
            end
        elsif @dir == 1
            if curve == "/"
                self.right
            else
                self.left
            end
        elsif @dir == 2
            if curve == "/"
                self.left
            else
                self.right
            end
        elsif @dir == 3
            if curve == "/"
                self.right
            else
                self.left
            end
        end
    end
    def update(grid)
        case @dir
        when 0
            @x += 1
        when 1
            @y -= 1
        when 2
            @x -= 1
        when 3
            @y += 1
        end
        if grid[@y][@x] == "/" || grid[@y][@x] == "\\"
            self.turn(grid[@y][@x])
        elsif grid[@y][@x] == "+"
            self.crossroad
        end
    end
end

file = File.open("day13.txt")
grid = []
while !file.eof?
    grid << file.readline
end
carts = []
for i in 0...grid.length
    for j in 0...grid[i].length
        if grid[i][j] == ">" || grid[i][j] == "<" || grid[i][j] == "v" || grid[i][j] == "^"
            carts << Cart.new(j,i,grid[i][j])
            if grid[i][j] == ">" || grid[i][j] == "<"
                grid[i][j] = "-"
            else 
                grid[i][j] = "|"
            end
        end
    end
end

i = 0
collision = false
puts carts.length
loner = false
loop do 
    carts.sort!
    #carts.each do |x|
        #print "#{x.getPos.join(",")}\t"
    #end
    #puts
    todelete = []
    for i in 0...carts.length
        carts[i].update(grid)
        if carts.count(carts[i]) > 1
            if !collision
                puts carts[i].getPos.join(",")
                collision = true
            end
            carts.each do |x|
                if x == carts[i]
                    todelete << x
                end
            end
            puts carts.length
        end
    end
    todelete.each do |x|
        carts.delete(x)
    end
    if carts.length == 1
        puts carts[0].getPos.join(",")
        loner = true
        break
    end
end
