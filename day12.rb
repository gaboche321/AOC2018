class Pot
    attr_accessor :plant
    def initialize(plant)
        @plant = plant
        @next = plant
    end
    def setNext(plant)
        @next = plant
    end
    def update
        @plant = @next
    end
end
class Rule
    attr_accessor :input, :output
    def initialize(input, output)
        @input = input
        @output = output
    end
end
def test(testee, rules)
    rules.each do |x|
        if x.input == testee
            return x.output
        end
    end
end
def updateAll(pots)
    pots.each do |x|
        x.update
    end
end
def generation(pots, rules)
    #pots[0].setNext(test(pots[pots.length - 2].plant + pots[pots.length - 1].plant + pots[0].plant + pots[1].plant + pots[2].plant, rules))
    #pots[1].setNext(test(pots[pots.length - 1].plant + pots[0].plant + pots[1].plant + pots[2].plant + pots[3].plant, rules))
    for i in 2...pots.length-2
        pots[i].setNext(test(pots[i - 2].plant + pots[i-1].plant + pots[i].plant + pots[i+1].plant + pots[i+2].plant, rules))
    end
    #pots[pots.length - 2].setNext(test(pots[pots.length - 4].plant + pots[pots.length - 3].plant + pots[pots.length - 2].plant + pots[pots.length - 1].plant + pots[0].plant, rules))
    #pots[pots.length - 1].setNext(test(pots[pots.length - 3].plant + pots[pots.length - 2].plant + pots[pots.length - 1].plant + pots[0].plant + pots[1].plant, rules))
    updateAll(pots)
end
def showPots(pots)
    pots.each do |x|
        print x.plant
    end
    puts
end
def plantCount(pots)
    count = 0
    for i in 0...pots.length
        if pots[i].plant == "#"
            count += (i-10)
        end
    end
    return count
end


file = File.open("day12.txt")
initial = ".........."
initial << file.readline.split(" ")[2]
initial << "..............................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................."
initial << "..............................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................."
initial << "..............................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................."
initial << "..............................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................."
initial << "..............................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................."
pots = []
rules = []
initial.each_char do |x|
    pots << Pot.new(x)
end
while !file.eof?
    input = file.readline
    if input[0] == "." || input[0] == "#"
        ary = input.split(" ")
        rules << Rule.new(ary[0], ary[2])
    end
end

print "0\t"
showPots(pots)
lastvalue = plantCount(pots)
endval = 0
for i in 1..158
    generation(pots,rules)
    print "#{i}\t"
    newvalue = plantCount(pots)
    #showPots(pots)
    puts newvalue-lastvalue
    lastvalue = newvalue
end
puts lastvalue
puts plantCount(pots)
puts lastvalue + (86 * (50000000000-158))

