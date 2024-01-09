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

    def summary
        visitor_count = count_visitors
        revenue_earned = total_carnival_revenue
        visitors_info = visitor_information
        rides_info = ride_information
    end


    def total_carnival_revenue
        total_revenue = @rides.sum do |ride|
            ride.total_revenue
        end
        total_revenue.to_i
    end 

    def count_visitors
        @rider_log.keys.sum.to_i
    end

    def visitor_information
        @rides.flatten.map do |ride|
            ride.rider_log.map do |visitor_name, times_ridden|
                visitor = @visitors.find { |visitor| visitor.name == name }
                {
                    visitor: visitor,
                    favorite_ride: ride.favorite_ride(visitor)
                    total_money_spent: visitor.total_money_spent_by_visitor
                }
            end
        end
    end

    def ride_information
        @rides.map do |ride|
            {
                ride: ride
                riders: ride.rider_log.map { |visitor_name| find_visitor_by_name(visitor_name) }
                total_revenue: ride.total_revenue
            }
        end
    end

    def search_visitor_by_name(visitor_name)
        found_visitor = nil        
        @rides.each do |ride|
            found_visitor = ride.rider_log.keys.find do |visitor_name|
                visitor_name == name
            end
        end
        found_visitor
    end

end