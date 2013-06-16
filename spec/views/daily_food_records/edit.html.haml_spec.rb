require 'spec_helper'

describe "daily_food_records/edit" do
  before(:each) do
    @daily_food_record = assign(:daily_food_record, stub_model(DailyFoodRecord,
      :user_id => 1
    ))
  end

  it "renders the edit daily_food_record form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", daily_food_record_path(@daily_food_record), "post" do
      assert_select "input#daily_food_record_user_id[name=?]", "daily_food_record[user_id]"
    end
  end
end
