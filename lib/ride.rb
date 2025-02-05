class Ride
    attr_reader :name, :min_height, :admission_fee, :excitement, :rider_log, :total_revenue

    def initialize(ride_attributes)
        @name = ride_attributes[:name]
        @min_height = ride_attributes[:min_height]
        @admission_fee = ride_attributes[:admission_fee]
        @excitement = ride_attributes[:excitement]
        @rider_log = Hash.new(0)
    end

    def total_revenue
        @rider_log.values.sum * @admission_fee
    end

    def board_rider(visitor)
        if visitor.tall_enough?(@min_height) && visitor.preference_included?(@excitement) && visitor.sufficient_funds?(@admission_fee)
            visitor.pay_up(@admission_fee)
            @rider_log[visitor.name] += 1
        end
    end

    def total_times_ridden
        @total_times_ridden = @rider_log.values.sum
    end

    def favorite_ride(visitor)
        favorite_ride = @rider_log.select { |name, times_ridden|
            name == visitor.name }.max_by do |name, times_ridden|
                times_ridden
            end        
    end
end
