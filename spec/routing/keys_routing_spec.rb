require "rails_helper"

RSpec.describe API::KeysController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/api/keys").to route_to("api/keys#index")
    end

    it "routes to #show" do
      expect(:get => "/api/keys/1").to route_to("api/keys#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/api/keys").to route_to("api/keys#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/api/keys/1").to route_to("api/keys#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/api/keys/1").to route_to("api/keys#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/api/keys/1").to route_to("api/keys#destroy", :id => "1")
    end
  end
end
