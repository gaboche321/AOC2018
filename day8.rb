class Node
    attr_accessor :children, :meta
    def initialize
        @children = Array.new
        @meta = Array.new
    end
    def lengthofInput
        length = 2 + @meta.length
        @children.each do |x|
            length += x.lengthofInput
        end
        return length
    end
    def nodeValue
        #puts "here"
        print "childs #{@children.length}  metas #{@meta.length} \n"
        value = 0
        if @children.length == 0
            #puts "here2"
            @meta.each do |x|
                value += x
            end
        else
            #puts "here3"
            @meta.each do |x|
                if x <= @children.length
                    value += @children[x-1].nodeValue
                end
            end
        end
        return value
    end
end

def makeTree (input, position, tree)
    node = Node.new
    tree << node
    babies = input[position].to_i
    #puts babies
    position += 1
    metadata = input[position].to_i
    #puts metadata
    position += 1
    for i in 0...babies
        #puts "sending : position #{position}"
        newnode = makeTree(input,position, tree)
        node.children << newnode
        position += newnode.lengthofInput
    end
    for i in 0...metadata
        node.meta << input[position].to_i
        #puts input[position].to_i
        position += 1
    end
    return node
end

file = File.open("day8.txt")
input = file.read.split(" ")
i = 0
tree = Array.new

makeTree(input,i,tree)
metasum = 0
tree.each do |x|
    x.meta.each do |y|
        metasum += y
    end
end
puts "metasum : #{metasum}"
puts tree[0].nodeValue