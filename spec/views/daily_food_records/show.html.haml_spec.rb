require 'spec_helper'

describe "daily_food_records/show" do
  before(:each) do
    @daily_food_record = assign(:daily_food_record, stub_model(DailyFoodRecord,
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
