require 'spec_helper'

RSpec.describe Ride do
    before :each do
        @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    end
    
end