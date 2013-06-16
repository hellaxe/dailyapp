require 'spec_helper'

describe "ingredients/show" do
  before(:each) do
    @ingredient = assign(:ingredient, stub_model(Ingredient,
      :size => 1.5,
      :recipe_id => 1,
      :product_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
