require 'spec_helper'

describe "portions/show" do
  before(:each) do
    @portion = assign(:portion, stub_model(Portion,
      :size => 1.5,
      :meal_id => 1,
      :food_id => 2
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
