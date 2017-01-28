require "rails_helper"

RSpec.describe PostulationsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/postulations").to route_to("postulations#index")
    end

    it "routes to #new" do
      expect(:get => "/postulations/new").to route_to("postulations#new")
    end

    it "routes to #show" do
      expect(:get => "/postulations/1").to route_to("postulations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/postulations/1/edit").to route_to("postulations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/postulations").to route_to("postulations#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/postulations/1").to route_to("postulations#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/postulations/1").to route_to("postulations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/postulations/1").to route_to("postulations#destroy", :id => "1")
    end

  end
end
