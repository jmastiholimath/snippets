require 'rails_helper'

RSpec.describe Snippet, type: :model do
  it "Do not save snippet description more than 8192" do
    expect(Snippet.new(description: (0...8193).map { ('a'..'z').to_a[rand(26)] }.join)).to_not be_valid
  end

  it "Do not save snippet with blank description" do
    expect(Snippet.new(description: '')).to_not be_valid
  end

  it "create snippet with valid attributes" do
    expect(Snippet.new(description: 'Anything')).to be_valid
  end
end
