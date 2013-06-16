require "spec_helper"

describe DailyFoodRecordsController do
  describe "routing" do

    it "routes to #index" do
      get("/daily_food_records").should route_to("daily_food_records#index")
    end

    it "routes to #new" do
      get("/daily_food_records/new").should route_to("daily_food_records#new")
    end

    it "routes to #show" do
      get("/daily_food_records/1").should route_to("daily_food_records#show", :id => "1")
    end

    it "routes to #edit" do
      get("/daily_food_records/1/edit").should route_to("daily_food_records#edit", :id => "1")
    end

    it "routes to #create" do
      post("/daily_food_records").should route_to("daily_food_records#create")
    end

    it "routes to #update" do
      put("/daily_food_records/1").should route_to("daily_food_records#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/daily_food_records/1").should route_to("daily_food_records#destroy", :id => "1")
    end

  end
end
