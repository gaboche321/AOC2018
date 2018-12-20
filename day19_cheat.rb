sum = 0
for i in 1..10551361
    if 10551361 % i == 0
        puts i
        sum += i
    end
end
puts sum