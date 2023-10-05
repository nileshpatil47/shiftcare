require 'spec_helper'

describe Shift do
  it "needs a url to initialize" do
    expect { Shift.new }.to raise_error(ArgumentError)
  end
end
