class Visitor
    attr_reader :name, :height, :spending_money, :preferences

    def initialize(name, height, spending_money)
        @name = name
        @height = height
        @spending_money = spending_money.gsub("$", "").to_i
        @preferences = []
    end

    def add_preference(preference)
        @preferences << preference
    end

    def preference_included?(preference)
        @preferences.include?(preference)
    end      

    def tall_enough?(minimum_height_to_ride)
        @height >= minimum_height_to_ride         
    end

    def pay_up(admission_fee)
        @spending_money -= admission_fee if sufficient_funds?(admission_fee)
    end

    def sufficient_funds?(total)
        @spending_money >= total
    end

    def total_money_spent_by_visitor
        @rider_log[visitor.name] * @admission_fee
    end

    def total_times_ridden
        @rider_log[visitor.name]
    end

end