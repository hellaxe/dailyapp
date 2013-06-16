require 'spec_helper'

describe "foods/index" do
  before(:each) do
    assign(:foods, [
      stub_model(Food,
        :name => "Name",
        :protein => 1.5,
        :carbohydrate => 1.5,
        :fat => 1.5,
        :energy => 1.5,
        :user_id => 1,
        :consumable_id => 2,
        :consumable_type => "Consumable Type"
      ),
      stub_model(Food,
        :name => "Name",
        :protein => 1.5,
        :carbohydrate => 1.5,
        :fat => 1.5,
        :energy => 1.5,
        :user_id => 1,
        :consumable_id => 2,
        :consumable_type => "Consumable Type"
      )
    ])
  end

  it "renders a list of foods" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Consumable Type".to_s, :count => 2
  end
end
