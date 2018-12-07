class Step
    attr_accessor :reqs, :children, :done, :name, :assigned
    def initialize(name)
        @name = name
        @reqs = []
        @children = []
        @done = false
        @assigned = false
    end
    def eql?(other)
        return @name == other.name
    end
    def canDo?
        if @reqs.length == 0
            return true
        end
        @reqs.each do |x|
            if !x.done
                return false
            end
        end
        return true
    end
    def operate
        @done = true
        #print @name
        toCheck = Array.new
        @children.each do |x|
            if !x.done
                toCheck << x
            end
        end    
        return toCheck 
    end
    def <=>(other)
        return  @name.to_s <=> other.name.to_s 
    end
end

class Worker
    attr_accessor :task, :time
    def initialize
        @task = nil
        @time = 0
    end
    def assign(task)
        @task = task
        @task.assigned = true
        @time = 60 + (@task.name.to_s.ord - 64)
    end
end
def assignment(workers, toCheck)
    workers.each do |x|
        if x.task == nil
            toCheck.each do |y|
                #puts "checking : #{y.name} cando?#{y.canDo?} assigned:#{y.assigned}"
                if y.canDo? && !y.assigned
                    #puts "assigning #{y.name}"
                    x.assign(y)
                    break
                end
            end
        end
    end
end
def work(workers, toCheck)
    workers.each do |x|
        
        if x.task != nil
            x.time -= 1
            if x.time == 0
                toCheck += x.task.operate
                toCheck.delete(x.task)
                
                x.task = nil
            end
            
        end
    end
    return toCheck
end
def worksecond(workers, toCheck)
    
end
def parse
    file = File.open("day7.txt")
    steps = Hash.new
    while !file.eof?
        input = file.readline.split(" ")
        a = input[1].to_sym
        b = input[7].to_sym
        if steps[a] == nil
            steps[a] = Step.new(a)
        end
        if steps[b] == nil
            steps[b] = Step.new(b)
        end
        steps[a].children << steps[b]
        steps[b].reqs << steps[a]
    end
    return steps
end


steps = parse
start = nil
steps.each do |x,y|
    y.children.sort!
    if y.reqs.length == 0
        start = x
    else
        y.reqs.sort!
    end
end
toCheck = [steps[start]]
workers = Array.new
workers << Worker.new
workers << Worker.new
workers << Worker.new
workers << Worker.new
workers << Worker.new

=begin
while toCheck.length > 0
    toCheck.sort!
    toCheck.each do |x|
        if x.canDo?
            toCheck += x.operate
            toCheck.delete(x)
            break
        end
    end
end
steps.each do |x,y|
    y.done = false
=end
puts
toCheck = [steps[start]]
tick = 0
assignment(workers,toCheck)
while toCheck.length > 0
    #puts "#{tick}\t0\t1"
    #print "\t"
    #workers.each do |x|
    #    if x.task == nil
    #        print "."
    #    else 
    #        print x.task.name
    #    end 
    #    print "\t"
    #end
    toCheck.sort!
    toCheck = work(workers,toCheck)
    assignment(workers,toCheck)
    
    tick += 1
    
    
    #puts
    #if tick == 200 then break end
end
puts tick
=begin
 puts "#{tick}\t0\t1\t2\t3\t4"
    print "\t"
    workers.each do |x|
        if x.task == nil
            print "."
        else 
            print x.task.name
        end 
        print "\t"
=end
