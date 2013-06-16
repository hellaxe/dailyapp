require 'spec_helper'

describe "foods/new" do
  before(:each) do
    assign(:food, stub_model(Food,
      :name => "MyString",
      :protein => 1.5,
      :carbohydrate => 1.5,
      :fat => 1.5,
      :energy => 1.5,
      :user_id => 1,
      :consumable_id => 1,
      :consumable_type => "MyString"
    ).as_new_record)
  end

  it "renders new food form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", foods_path, "post" do
      assert_select "input#food_name[name=?]", "food[name]"
      assert_select "input#food_protein[name=?]", "food[protein]"
      assert_select "input#food_carbohydrate[name=?]", "food[carbohydrate]"
      assert_select "input#food_fat[name=?]", "food[fat]"
      assert_select "input#food_energy[name=?]", "food[energy]"
      assert_select "input#food_user_id[name=?]", "food[user_id]"
      assert_select "input#food_consumable_id[name=?]", "food[consumable_id]"
      assert_select "input#food_consumable_type[name=?]", "food[consumable_type]"
    end
  end
end
