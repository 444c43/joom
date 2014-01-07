require 'spec_helper'

describe Photo do
  describe ".all" do
    it "returns collections of url's " do
      Photo.all.should_not_be_empty
    end
  end
end
