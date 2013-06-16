require 'spec_helper'

describe "meals/edit" do
  before(:each) do
    @meal = assign(:meal, stub_model(Meal,
      :name => "MyString",
      :description => "MyString",
      :daily_record_id => 1
    ))
  end

  it "renders the edit meal form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", meal_path(@meal), "post" do
      assert_select "input#meal_name[name=?]", "meal[name]"
      assert_select "input#meal_description[name=?]", "meal[description]"
      assert_select "input#meal_daily_record_id[name=?]", "meal[daily_record_id]"
    end
  end
end
