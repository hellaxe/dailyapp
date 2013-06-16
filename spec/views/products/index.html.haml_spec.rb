require 'spec_helper'

describe "products/index" do
  before(:each) do
    assign(:products, [
      stub_model(Product,
        :name => "Name",
        :manufacturer => "Manufacturer",
        :is_verified => false,
        :protein => 1.5,
        :carbohydrate => 1.5,
        :fat => 1.5,
        :calories => 1.5,
        :user_id => 1
      ),
      stub_model(Product,
        :name => "Name",
        :manufacturer => "Manufacturer",
        :is_verified => false,
        :protein => 1.5,
        :carbohydrate => 1.5,
        :fat => 1.5,
        :calories => 1.5,
        :user_id => 1
      )
    ])
  end

  it "renders a list of products" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Manufacturer".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
