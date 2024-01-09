require 'spec_helper'

RSpec.describe Visitor do
    before :each do
        @visitor1 = Visitor.new("Bruce", 54, "$10")
    end

    it "exists" do
        expect(@visitor1).to be_an_instance_of Visitor
    end

end

