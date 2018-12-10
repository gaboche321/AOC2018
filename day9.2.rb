class Node
    attr_accessor :value, :nextNode, :prevNode
    def initialize(value, prevNode = self, nextNode = self)
        @value = value
        @prevNode = prevNode 
        @nextNode = nextNode
    end
    def insertAfter(value)
        newNode = Node.new(value, self, @nextNode)
        @nextNode.prevNode = newNode
        @nextNode = newNode
        return newNode
    end
    def delete
        @prevNode.nextNode = @nextNode
        @nextNode.prevNode = @prevNode
        return @nextNode
    end
end

def show(node,length)
    for i in 0...length
        print "#{node.value} "
        node = node.nextNode
    end
    puts
end

numplayers = 416
lastmarble = 71617*100
players = Array.new(numplayers, 0)
newmarble = 1
player = 0
length = 1
currentNode = Node.new(0)
firstNode = currentNode
show(firstNode,length)
while newmarble <= lastmarble

    if newmarble % 23 == 0
        players[player] += newmarble
        currentNode = currentNode.prevNode
        currentNode = currentNode.prevNode
        currentNode = currentNode.prevNode
        currentNode = currentNode.prevNode
        currentNode = currentNode.prevNode
        currentNode = currentNode.prevNode
        currentNode = currentNode.prevNode
        #puts currentNode.value
        players[player] += currentNode.value
        currentNode = currentNode.delete 
        length -= 1
    else
        currentNode = currentNode.nextNode.insertAfter(newmarble)
        length += 1
    end
    player += 1
    if player >= players.length
        player %= players.length
    end 
    newmarble += 1
    #show(firstNode, length)
end
puts players.max
puts players.index(players.max)
