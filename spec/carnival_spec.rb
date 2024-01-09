require 'spec_helper'

RSpec.describe Carnival do
    before :each do
        @carnival1 = Carnival.new(14)
        @visitor1 = Visitor.new("Bruce", 54, "$10")
        @visitor2 = Visitor.new("Tucker", 36, "$5")
        @visitor3 = Visitor.new("Penny", 64, "$15")
        @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
        @ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
        @ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
    end

    it "exists" do
        expect(@carnival1).to be_an_instance_of Carnival
    end

    it "#add_ride" do
        @carnival1.add_ride(@ride1)
        @carnival1.add_ride(@ride2)
        @carnival1.add_ride(@ride3)

        expect(@carnival1.rides).to eq([@ride1, @ride2, @ride3])
    end

    describe "most [whatever] ride" do
        before :each do
            @carnival1.add_ride(@ride1)
            @carnival1.add_ride(@ride2)
            @visitor1.add_preference(:gentle)
            @visitor1.add_preference(:excitement)
            @visitor2.add_preference(:gentle)
            @visitor3.add_preference(:excitement)
            @ride1.board_rider(@visitor1)
            @ride1.board_rider(@visitor2)
            @ride1.board_rider(@visitor1)
            @ride2.board_rider(@visitor2)
            @ride2.board_rider(@visitor1)
            @ride3.board_rider(@visitor3)
        end

        it "#most_popular_ride" do
            expect(@carnival1.most_popular_ride).to eq(@ride1)
        end

        it "#most_profitable_ride" do
            expect(@carnival1.most_profitable_ride).to eq(@ride2)
        end 
    end  
    
    it "#total_carnival_revenue" do
        expect(@carnival1.total_carnival_revenue).to eq(0)

        @carnival1.add_ride(@ride1)
        @carnival1.add_ride(@ride2)
        @visitor1.add_preference(:gentle)
        @visitor2.add_preference(:gentle)
        @ride1.board_rider(@visitor1)
        @ride1.board_rider(@visitor2)
        @ride2.board_rider(@visitor1)

        expect(@carnival1.total_carnival_revenue).to eq(7)
    end

end
