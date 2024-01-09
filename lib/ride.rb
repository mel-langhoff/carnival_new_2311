class Ride
    attr_reader :name, :min_height, :admission_fee, :excitement, :rider_log, :revenue



    def initialize(ride_attributes)
        @name = ride_attributes[:name]
        @min_height = ride_attributes[:min_height]
        @admission_fee = ride_attributes[:admission_fee]
        @excitement = ride_attributes[:excitement]
        @rider_log = {}
    end

    def total_revenue
        @revenue = 0

    end

    def board_rider(visitor)
        #call pay_up
        #call tall_enough?
    end

    def add_to_rider_log

    end

end
