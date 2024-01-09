require 'spec_helper'

RSpec.describe Carnival do
    before :each do
        @carnival1 = Carnival.new
    end

    it "exists" do
        expect(@carnival1).to be_an_instance_of Carnival
    end

end
