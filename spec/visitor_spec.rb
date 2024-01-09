require 'spec_helper'

RSpec.describe Visitor do
    before :each do
        @visitor1 = Visitor.new("Bruce", 54, "$10")
        @visitor2 = Visitor.new("Tucker", 36, "$5")
        @visitor3 = Visitor.new("Penny", 64, "$15")
    end

    it "exists" do
        expect(@visitor1).to be_an_instance_of Visitor
    end

    it "#add_preference" do
        @visitor1.add_preference(:gentle)
        @visitor1.add_preference(:thrilling)

        expect(@visitor1.preferences).to include(:gentle, :thrilling)
    end

    it "#tall_enough?" do
        expect(@visitor1.tall_enough?(54)).to be true
        expect(@visitor2.tall_enough?(54)).to be false
        expect(@visitor3.tall_enough?(54)).to be true
        expect(@visitor1.tall_enough?(64)).to be false
    end

    it "#pay_up" do
        expect(@visitor1.pay_up(1)).to eq(9)
    end

    it "#sufficient_funds?" do
        expect(@visitor1.sufficient_funds?(11)).to be false
    end

    it "#preference_included?" do
        @visitor1.add_preference(:gentle)

        expect(@visitor1.preference_included?(:gentle)).to be true
        expect(@visitor1.preference_included?(:jskldjakfslkf)).to be false
    end
end

