require "rails_helper"

RSpec.describe NamingsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/namings").to route_to("namings#index")
    end

    it "routes to #new" do
      expect(:get => "/namings/new").to route_to("namings#new")
    end

    it "routes to #show" do
      expect(:get => "/namings/1").to route_to("namings#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/namings/1/edit").to route_to("namings#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/namings").to route_to("namings#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/namings/1").to route_to("namings#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/namings/1").to route_to("namings#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/namings/1").to route_to("namings#destroy", :id => "1")
    end

  end
end
