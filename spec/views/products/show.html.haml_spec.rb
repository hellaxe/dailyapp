require 'spec_helper'

describe "products/show" do
  before(:each) do
    @product = assign(:product, stub_model(Product,
      :name => "Name",
      :manufacturer => "Manufacturer",
      :is_verified => false,
      :protein => 1.5,
      :carbohydrate => 1.5,
      :fat => 1.5,
      :calories => 1.5,
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Manufacturer/)
    rendered.should match(/false/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
    rendered.should match(/1/)
  end
end
