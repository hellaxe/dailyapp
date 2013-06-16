require 'spec_helper'

describe "daily_food_records/index" do
  before(:each) do
    assign(:daily_food_records, [
      stub_model(DailyFoodRecord,
        :user_id => 1
      ),
      stub_model(DailyFoodRecord,
        :user_id => 1
      )
    ])
  end

  it "renders a list of daily_food_records" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
