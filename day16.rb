$regs = [0,0,0,0]
def addr(input,instr,output)
    result = input.clone
    result[instr[3]] = input[instr[1]] + input[instr[2]]
    return result == output
end
def addi(input,instr,output)
    result = input.clone
    result[instr[3]] = input[instr[1]] + instr[2]
    return result == output
end
def mulr(input,instr,output)
    result = input.clone
    result[instr[3]] = input[instr[1]] * input[instr[2]]
    return result == output
end
def muli(input,instr,output)
    result = input.clone
    result[instr[3]] = input[instr[1]] * instr[2]
    return result == output
end
def banr(input,instr,output)
    result = input.clone
    result[instr[3]] = input[instr[1]] & input[instr[2]]
    return result == output
end
def bani(input,instr,output)
    result = input.clone
    result[instr[3]] = input[instr[1]] & instr[2]
    return result == output
end
def borr(input,instr,output)
    result = input.clone
    result[instr[3]] = input[instr[1]] | input[instr[2]]
    return result == output
end
def bori(input,instr,output)
    result = input.clone
    result[instr[3]] = input[instr[1]] | instr[2]
    return result == output
end
def setr(input,instr,output)
    result = input.clone
    result[instr[3]] = input[instr[1]]
    return result == output
end
def seti(input,instr,output)
    result = input.clone
    result[instr[3]] = instr[1]
    return result == output
end
def gtir(input, instr, output)
    result = input.clone
    if instr[1] > result[instr[2]]
        result[instr[3]] = 1
    else 
        result[instr[3]] = 0
    end
    return result == output
end
def gtri(input, instr, output)
    result = input.clone
    if result[instr[1]] > instr[2]
        result[instr[3]] = 1
    else 
        result[instr[3]] = 0
    end
    return result == output
end
def gtrr(input, instr, output)
    result = input.clone
    if result[instr[1]] > result[instr[2]]
        result[instr[3]] = 1
    else 
        result[instr[3]] = 0
    end
    return result == output
end
def eqir(input, instr, output)
    result = input.clone
    if instr[1] == result[instr[2]]
        result[instr[3]] = 1
    else 
        result[instr[3]] = 0
    end
    return result == output
end
def eqri(input, instr, output)
    result = input.clone
    if result[instr[1]] == instr[2]
        result[instr[3]] = 1
    else 
        result[instr[3]] = 0
    end
    return result == output
end
def eqrr(input, instr, output)
    result = input.clone
    if result[instr[1]] == result[instr[2]]
        result[instr[3]] = 1
    else 
        result[instr[3]] = 0
    end
    return result == output
end
def test(input)
    count = 0
        if addr(input[0],input[1],input[2]) 
            count += 1 
        end
        if addi(input[0],input[1],input[2]) 
            count += 1 
        end
        if mulr(input[0],input[1],input[2]) 
            count += 1 
        end
        if muli(input[0],input[1],input[2]) 
            count += 1 
        end
        if banr(input[0],input[1],input[2]) 
            count += 1 
        end
        if bani(input[0],input[1],input[2]) 
            count += 1 
        end
        if bori(input[0],input[1],input[2])
            count += 1 
        end
        if borr(input[0],input[1],input[2]) 
            count += 1 
        end
        if setr(input[0],input[1],input[2]) 
            count += 1 
        end
        if seti(input[0],input[1],input[2]) 
            count += 1 
        end
        if gtir(input[0],input[1],input[2])
            count += 1 
        end
        if gtri(input[0],input[1],input[2])
            count += 1 
        end
        if gtrr(input[0],input[1],input[2])
            count += 1 
        end
        if eqir(input[0],input[1],input[2])
            count += 1
        end
        if eqri(input[0],input[1],input[2])
            count += 1 
        end
        if eqrr(input[0],input[1],input[2])
            count += 1 
        end
    return count
end
def operate(instr)
    case instr[0]
    when 0  #seti
        $regs[instr[3]] = instr[1]
    when 1  #eqir
        $regs[instr[3]] = instr[1] == $regs[instr[2]] ? 1 : 0
    when 2  #setr
        $regs[instr[3]] = $regs[instr[1]]
    when 3  #gtir
        $regs[instr[3]] = instr[1] > $regs[instr[2]] ? 1 : 0
    when 4  #addi
        $regs[instr[3]] = $regs[instr[1]] + instr[2]
    when 5  #muli
        $regs[instr[3]] = $regs[instr[1]] * instr[2]
    when 6  #mulr
        $regs[instr[3]] = $regs[instr[1]] * $regs[instr[2]]
    when 7  #gtrr
        $regs[instr[3]] = $regs[instr[1]] > $regs[instr[2]] ? 1 : 0
    when 8  #bani
        $regs[instr[3]] = $regs[instr[1]] & instr[2]
    when 9  #gtri
        $regs[instr[3]] = $regs[instr[1]] > instr[2] ? 1 : 0
    when 10 #bori
        $regs[instr[3]] = $regs[instr[1]] | instr[2]
    when 11 #banr
        $regs[instr[3]] = $regs[instr[1]] & $regs[instr[2]]
    when 12 #borr
        $regs[instr[3]] = $regs[instr[1]] | $regs[instr[2]]
    when 13 #eqri
        $regs[instr[3]] = $regs[instr[1]] == instr[2] ? 1 : 0
    when 14 #eqrr
        $regs[instr[3]] = $regs[instr[1]] == $regs[instr[2]] ? 1 : 0
    when 15 #addr
        $regs[instr[3]] = $regs[instr[1]] + $regs[instr[2]]
    end
end

def modifyInput(triple)
    inputs = triple[0].delete("Before: []").split(",")
    output = [[],[],[]]
    inputs.each do |x|
        output[0] << x.to_i
    end
    inputs = triple[1].split(" ")
    inputs.each do |x|
        output[1] << x.to_i
    end
    inputs = triple[2].delete("After: []").split(",")
    inputs.each do |x|
        output[2] << x.to_i
    end
    return output
end
file = File.open("day16.txt")
num = 0
count = 0
outfile = File.new("day16out.txt", "w")
while !file.eof?
    triple = []
    triple << file.readline
    triple << file.readline
    triple << file.readline
    num += 1
    input = modifyInput(triple)
    ops = test(input)
    if ops >= 3
        count += 1
    end
    test = file.readline
    if test == "part2\n"
        break
    end
end
puts count
file.readline
file.readline
while !file.eof?
    line = file.readline.split(" ")
    input = []
    line.each do |x|
        input << x.to_i
    end
    operate(input)
end
puts $regs[0]