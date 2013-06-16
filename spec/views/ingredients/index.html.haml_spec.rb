require 'spec_helper'

describe "ingredients/index" do
  before(:each) do
    assign(:ingredients, [
      stub_model(Ingredient,
        :size => 1.5,
        :recipe_id => 1,
        :product_id => 2
      ),
      stub_model(Ingredient,
        :size => 1.5,
        :recipe_id => 1,
        :product_id => 2
      )
    ])
  end

  it "renders a list of ingredients" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
