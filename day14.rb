recipes = [3,7]
elf1 = 0
elf2 = 1
i = 0
while i < 50000000
    sum = recipes[elf1] + recipes[elf2]
    if sum >= 10
        recipes.push(sum / 10,sum % 10)
    else
        recipes.push(sum)
    end
    elf1 = (elf1 + recipes[elf1] + 1) % recipes.length
    elf2 = (elf2 + recipes[elf2] + 1) % recipes.length
    i += 1
end 
num = 633601
input = [6,3,3,6,0,1]
for j in num...num+10
    print recipes[j]
end
puts
puts recipes.length
for i in 0...recipes.length
    flag = true
    for j in 0...input.length
        if recipes[i+j] != input[j]
            flag = false
            break
        end
    end
    if flag
        puts i
        break
    end
end