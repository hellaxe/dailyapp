require 'spec_helper'

describe "products/edit" do
  before(:each) do
    @product = assign(:product, stub_model(Product,
      :name => "MyString",
      :manufacturer => "MyString",
      :is_verified => false,
      :protein => 1.5,
      :carbohydrate => 1.5,
      :fat => 1.5,
      :calories => 1.5,
      :user_id => 1
    ))
  end

  it "renders the edit product form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", product_path(@product), "post" do
      assert_select "input#product_name[name=?]", "product[name]"
      assert_select "input#product_manufacturer[name=?]", "product[manufacturer]"
      assert_select "input#product_is_verified[name=?]", "product[is_verified]"
      assert_select "input#product_protein[name=?]", "product[protein]"
      assert_select "input#product_carbohydrate[name=?]", "product[carbohydrate]"
      assert_select "input#product_fat[name=?]", "product[fat]"
      assert_select "input#product_calories[name=?]", "product[calories]"
      assert_select "input#product_user_id[name=?]", "product[user_id]"
    end
  end
end
