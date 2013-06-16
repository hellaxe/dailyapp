require 'spec_helper'

describe "foods/show" do
  before(:each) do
    @food = assign(:food, stub_model(Food,
      :name => "Name",
      :protein => 1.5,
      :carbohydrate => 1.5,
      :fat => 1.5,
      :energy => 1.5,
      :user_id => 1,
      :consumable_id => 2,
      :consumable_type => "Consumable Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Consumable Type/)
  end
end
