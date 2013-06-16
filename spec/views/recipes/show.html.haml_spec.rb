require 'spec_helper'

describe "recipes/show" do
  before(:each) do
    @recipe = assign(:recipe, stub_model(Recipe,
      :name => "Name",
      :description => "Description",
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Description/)
    rendered.should match(/1/)
  end
end