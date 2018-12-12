require 'digest'
seed = "ffykfhsq"
i = 0
count = 0
count2 = 0
pass2 = Array.new(8, "_")
while count2 < 8
    input = seed + i.to_s
    hash = Digest::MD5.hexdigest(input)
    #puts "#{input}\t#{hash}"
    if hash[0] == "0" && hash[1] == "0" && hash[2] == "0" && hash[3] == "0" && hash[4] == "0"
        char1 = hash[5]
        if count < 8
            #print char1
        end
        if char1.ord < 56 && char1.ord >= 48
            if pass2[char1.to_i] == "_"
                count2 += 1
                pass2[char1.to_i] = hash[6]
            end
            puts pass2.join
        end 
        count += 1
    end
    i += 1
end
puts 

