class Date
    attr_accessor :date, :guardID, :minutes
    def initialize(date, minutes)
        @date = String.new(date)
        @minutes = String.new(minutes)
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