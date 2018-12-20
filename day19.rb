
#$regs = [1,10551360,10551361,3,10551361,0]
$regs = [68,67,10551360,3,10551361,0]
$ip = 0
def operate(instr)
    case instr[0]
    when "seti"
        $regs[instr[3]] = instr[1]
    when "eqir"
        $regs[instr[3]] = instr[1] == $regs[instr[2]] ? 1 : 0
    when "setr"
        $regs[instr[3]] = $regs[instr[1]]
    when "gtir"
        $regs[instr[3]] = instr[1] > $regs[instr[2]] ? 1 : 0
    when "addi"
        $regs[instr[3]] = $regs[instr[1]] + instr[2]
    when "muli"
        $regs[instr[3]] = $regs[instr[1]] * instr[2]
    when "mulr"
        $regs[instr[3]] = $regs[instr[1]] * $regs[instr[2]]
    when "gtrr"
        $regs[instr[3]] = $regs[instr[1]] > $regs[instr[2]] ? 1 : 0
    when "bani"
        $regs[instr[3]] = $regs[instr[1]] & instr[2]
    when "gtri"
        $regs[instr[3]] = $regs[instr[1]] > instr[2] ? 1 : 0
    when "bori"
        $regs[instr[3]] = $regs[instr[1]] | instr[2]
    when "banr"
        $regs[instr[3]] = $regs[instr[1]] & $regs[instr[2]]
    when "borr"
        $regs[instr[3]] = $regs[instr[1]] | $regs[instr[2]]
    when "eqri"
        $regs[instr[3]] = $regs[instr[1]] == instr[2] ? 1 : 0
    when "eqrr"
        $regs[instr[3]] = $regs[instr[1]] == $regs[instr[2]] ? 1 : 0
    when "addr"
        $regs[instr[3]] = $regs[instr[1]] + $regs[instr[2]]
    end
end
def parseInput
    file = File.open("day19.txt")
    $ip = file.readline.split(" ")[1].to_i
    instrs = []
    while !file.eof?
        input = file.readline.split(" ")
        for i in 1..3
            input[i] = input[i].to_i
        end
        instrs << input
    end
    return instrs
end
def printRegs
    print "[#{$regs[0]},#{$regs[1]},#{$regs[2]},#{$regs[3]},#{$regs[4]},#{$regs[5]}]\n"
end
instrs = parseInput
loop do
    printRegs
    operate(instrs[$regs[$ip]])
    if $regs[$ip] < 0 || $regs[$ip] >= instrs.length
        break
    end
    $regs[$ip] += 1
end
puts $regs[0]