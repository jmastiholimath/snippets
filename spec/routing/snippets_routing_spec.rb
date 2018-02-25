require "rails_helper"

RSpec.describe SnippetsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/snippets").to route_to("snippets#index")
    end

    it "routes to #new" do
      expect(:get => "/snippets/new").to route_to("snippets#new")
    end

    it "routes to #show" do
      expect(:get => "/snippets/1").to route_to("snippets#show", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/snippets").to route_to("snippets#create")
    end

    
  end
end
