require 'spec_helper'

describe "portions/new" do
  before(:each) do
    assign(:portion, stub_model(Portion,
      :size => 1.5,
      :meal_id => 1,
      :food_id => 1
    ).as_new_record)
  end

  it "renders new portion form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", portions_path, "post" do
      assert_select "input#portion_size[name=?]", "portion[size]"
      assert_select "input#portion_meal_id[name=?]", "portion[meal_id]"
      assert_select "input#portion_food_id[name=?]", "portion[food_id]"
    end
  end
end
