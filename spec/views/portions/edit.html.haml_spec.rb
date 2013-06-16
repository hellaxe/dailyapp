require 'spec_helper'

describe "portions/edit" do
  before(:each) do
    @portion = assign(:portion, stub_model(Portion,
      :size => 1.5,
      :meal_id => 1,
      :food_id => 1
    ))
  end

  it "renders the edit portion form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", portion_path(@portion), "post" do
      assert_select "input#portion_size[name=?]", "portion[size]"
      assert_select "input#portion_meal_id[name=?]", "portion[meal_id]"
      assert_select "input#portion_food_id[name=?]", "portion[food_id]"
    end
  end
end
