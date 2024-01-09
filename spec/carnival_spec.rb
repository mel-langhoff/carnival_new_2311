require 'spec_helper'

RSpec.describe Carnival do
    before :each do
        @carnival1 = Carnival.new(14)
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


end
