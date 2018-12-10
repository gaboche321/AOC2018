numplayers = 416
lastmarble = 71617*100

class Game
    def initialize
        @marbles = [0]
        @position = 0
    end
    def updatepos(qty)
        @position += qty
        if @position >= @marbles.length
            @position %= @marbles.length
        end
        if @position < 0
            @position += @marbles.length
        end
    end
    def insertmarble(num)
        self.updatepos(2)
        #puts @position
        if @position == 0
            @marbles.push(num)
            @position = @marbles.length - 1
        else 
            @marbles.insert(@position, num)
        end
    end
    def scoring(num)
        #puts num
        self.updatepos(-7)
        score = @marbles.delete_at(@position) + num
        #puts score
        return score
    end
    def showmarbles
        @marbles.each do |x|
            print x
            print " "
        end
        puts
    end
end
def printPlayers(players)
    players.each do |x|
        print "#{x}\t"
    end
    puts
end
players = Array.new(numplayers, 0)
newmarble = 1
player = 0
game = Game.new
game.showmarbles
while newmarble <= lastmarble

    if newmarble % 23 == 0
        players[player] += game.scoring(newmarble)
        #printPlayers(players)
    else
        game.insertmarble(newmarble)
    end
    player += 1
    if player >= players.length
        player %= players.length
    end 
    newmarble += 1
    if newmarble % 10000 == 0
        puts newmarble
    end
    #game.showmarbles
end
puts players.max
puts players.index(players.max)
