require 'spec_helper'

RSpec.describe Ride do
    before :each do
        @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
        @visitor1 = Visitor.new("Bruce", 54, "$10")
        @visitor2 = Visitor.new("Tucker", 36, "$5")
        @visitor3 = Visitor.new("Penny", 64, "$15")
    end

    it "exists" do
        expect(@ride1).to be_an_instance_of Ride
    end

    it "#board_rider" do
        @visitor1.add_preference(:gentle)
        @visitor2.add_preference(:gentle)
        @ride1.board_rider(@visitor1)
        @ride1.board_rider(@visitor2)
        @ride1.board_rider(@visitor1)

        expect(@ride1.rider_log.first).to include("Bruce")
        expect(@ride1.rider_log.first).to include(2)
    end

    it "#total_revenue" do
        expect(@ride1.total_revenue).to eq(0)

        @visitor1.add_preference(:gentle)
        @visitor2.add_preference(:gentle)
        @ride1.board_rider(@visitor1)
        @ride1.board_rider(@visitor2)
        @ride1.board_rider(@visitor1)

        expect(@ride1.total_revenue).to eq(3)
    end

    it "reduces visitor spending money" do
        @visitor1.add_preference(:gentle)
        @visitor2.add_preference(:gentle)
        @ride1.board_rider(@visitor1)
        @ride1.board_rider(@visitor2)
        @ride1.board_rider(@visitor1)

        expect(@visitor1.spending_money).to eq(8)
        expect(@visitor2.spending_money).to eq(4)
    end

end