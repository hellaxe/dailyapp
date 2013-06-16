require 'spec_helper'

describe "meals/show" do
  before(:each) do
    @meal = assign(:meal, stub_model(Meal,
      :name => "Name",
      :description => "Description",
      :daily_record_id => 1
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
