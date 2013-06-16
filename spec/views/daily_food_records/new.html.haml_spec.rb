require 'spec_helper'

describe "daily_food_records/new" do
  before(:each) do
    assign(:daily_food_record, stub_model(DailyFoodRecord,
      :user_id => 1
    ).as_new_record)
  end

  it "renders new daily_food_record form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", daily_food_records_path, "post" do
      assert_select "input#daily_food_record_user_id[name=?]", "daily_food_record[user_id]"
    end
  end
end
