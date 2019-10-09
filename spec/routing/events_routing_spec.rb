require "rails_helper"

RSpec.describe API::EventsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/api/events").to route_to("api/events#index")
    end

    it "routes to #new" do
      expect(:get => "/api/events/new").to route_to("api/events#new")
    end

    it "routes to #show" do
      expect(:get => "/api/events/1").to route_to("api/events#show", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/api/events").to route_to("api/events#create")
    end
  end
end
