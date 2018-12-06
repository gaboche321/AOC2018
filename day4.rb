def mostAsleep(hsh)
    mostasleep = 0
    maxminutes = 0
    hsh.each do |x,y|
        sumSleep = 0
        y.each do |z|
            sumSleep += z
        end
        if sumSleep > maxminutes
            maxminutes = sumSleep
            mostasleep = x
        end
    end
    return mostasleep
end
def mostAsleep2(hsh)
    mostasleep = 0
    maxminutes = 0
    hsh.each do |x,y|
        if y.max > maxminutes
            maxminutes = y.max
            mostasleep = x
        end
    end
    return mostasleep * hsh[mostasleep].index(hsh[mostasleep].max)
end
def nextDay(date)
    dateary = date.split("-")
    for i in 1..2
        dateary[i] = dateary[i].to_i
    end
    dateary[2] += 1
    if dateary[1] == 1 && dateary[2] == 32
        dateary[1] = 2 
        dateary[2] = 1
    elsif dateary[1] == 2 && dateary[2] == 29
        dateary[1] = 3 
         dateary[2] = 1
    elsif dateary[1] == 3 && dateary[2] == 32
        dateary[1] = 4 
         dateary[2] = 1
    elsif dateary[1] == 4 && dateary[2] == 31
        dateary[1] = 5 
         dateary[2] = 1
    elsif dateary[1] == 5 && dateary[2] == 32
        dateary[1] = 6 
         dateary[2] = 1
    elsif dateary[1] == 6 && dateary[2] == 31
        dateary[1] = 7 
         dateary[2] = 1
    elsif dateary[1] == 7 && dateary[2] == 32
        dateary[1] = 8 
         dateary[2] = 1
    elsif dateary[1] == 8 && dateary[2] == 32
        dateary[1] = 9 
        dateary[2] = 1
    elsif dateary[1] == 9 && dateary[2] == 31
        dateary[1] = 10 
        dateary[2] = 1
    elsif dateary[1] == 10 && dateary[2] == 32
        dateary[1] = 11 
        dateary[2] = 1
    elsif dateary[1] == 11 && dateary[2] == 31
        dateary[1] = 12 
        dateary[2] = 1
    elsif dateary[1] == 12 && dateary[2] == 32
        dateary[1] = 1 
        dateary[2] = 1
        year = dateary[0].to_i
        year += 1
        dateary[0] = year.to_s
    end
    for i in 1..2
        dateary[i] = dateary[i].to_s
        if dateary[i].length == 1
            dateary[i].prepend("0")
        end
    end
    return dateary.join("-")
end
class Date
    attr_accessor :date, :guardID, :minutes
    def initialize(date)
        @date = String.new(date)
        @minutes = Array.new(60, false)
        @guardID
    end
    def eql?(other)
        return @date == other.date
    end
    alias == eql?
    def <=>(other)
        if @date == other.date
            return 0
        end
        dateary = @date.split("-")
        otherdate = other.date.split("-")
        if dateary[1].to_i < otherdate[1].to_i 
            return -1
        elsif dateary[1].to_i > otherdate[1].to_i
            return 1
        elsif dateary[1].to_i == otherdate[1].to_i
            if dateary[2].to_i < otherdate[2].to_i
                return -1
            else 
                return 1
            end
        end
    end
end
dates = Array.new()
file = File.open("day4.txt")
while !file.eof?
    input = file.readline.delete("[]").split(" ")
    time = input[1].split(":")
    date = input[0]
    if time[0] == "23"
        date = nextDay(input[0])
    end
    
    newdate = Date.new(date)
    if !dates.include?(newdate)
        dates << newdate
    end
    index = dates.index(newdate)
    
    if input[2] == "Guard"
        dates[index].guardID = input[3].delete("#").to_i
    elsif input[2] == "falls"
        dates[index].minutes[time[1].to_i] = true
    elsif input[2] == "wakes"
        dates[index].minutes[time[1].to_i] = true
    end
end
dates.sort!
dates.each do |x|
    toggle = false
    for i in 0...60
        if !toggle && x.minutes[i]
            toggle = true
        elsif toggle && x.minutes[i]
            toggle = false
            x.minutes[i] = false
        end
        if toggle
            x.minutes[i] = true
        end
    end
end
asleeps = Hash.new()
dates.each do |x|
    if asleeps[x.guardID] == nil
        asleeps[x.guardID] = Array.new(60, 0)
    end
    for i in 0...60
        if x.minutes[i]
            asleeps[x.guardID][i] += 1
        end
    end
end
most = mostAsleep(asleeps)
puts most*asleeps[most].index(asleeps[most].max)
puts mostAsleep2(asleeps)
