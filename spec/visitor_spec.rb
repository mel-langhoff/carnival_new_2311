require 'spec_helper'

RSpec.describe Visitor do
    before :each do
        @visitor = Visitor.new(name, height, spending_money)
    end

    it "exists" do
        expect(@visitor).to be_an_instance_of Visitor
    end

end

