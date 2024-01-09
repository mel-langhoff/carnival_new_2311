class Carnival
    attr_reader :duration, :rides

    def initialize(duration)
        @duration = duration
        @rides = []
    end

    def add_ride(ride)
        @rides << ride
    end

    def most_popular_ride
        most_popular_ride = @rides.max_by do |ride|
            ride.total_times_ridden
        end
    end

    def most_profitable_ride
        most_profitable_ride = @rides.max_by do |ride|
            ride.total_revenue
        end
    end

    def total_carnival_revenue
        total_revenue = @rides.sum do |ride|
            ride.total_revenue
        end
    end

    


end