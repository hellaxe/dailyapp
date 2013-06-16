require 'spec_helper'

describe "meals/new" do
  before(:each) do
    assign(:meal, stub_model(Meal,
      :name => "MyString",
      :description => "MyString",
      :daily_record_id => 1
    ).as_new_record)
  end

  it "renders new meal form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", meals_path, "post" do
      assert_select "input#meal_name[name=?]", "meal[name]"
      assert_select "input#meal_description[name=?]", "meal[description]"
      assert_select "input#meal_daily_record_id[name=?]", "meal[daily_record_id]"
    end
  end
end
