require 'spec_helper'

RSpec.describe Visitor do
    before :each do
        @visitor1 = Visitor.new("Bruce", 54, "$10")
    end

    it "exists" do
        expect(@visitor1).to be_an_instance_of Visitor
    end

    it "#add_preference)" do
        @visitor1.add_preference(:gentle)
        @visitor1.add_preference(:thrilling)

        expect(@visitor1.preferences).to include(:thrilling)
    end

end

