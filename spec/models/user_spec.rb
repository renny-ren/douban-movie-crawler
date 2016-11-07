require 'spec_helper'

describe User do
  it "is valid with a unique username" do
    user = User.new(username: '12')
    expect(user).to be_valid
  end
  
  it "is invalid without a username" do
    expect(User.new(username: nil)).to be_invalid
  end
end