require 'spec_helper'

describe "ingredients/edit" do
  before(:each) do
    @ingredient = assign(:ingredient, stub_model(Ingredient,
      :size => 1.5,
      :recipe_id => 1,
      :product_id => 1
    ))
  end

  it "renders the edit ingredient form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", ingredient_path(@ingredient), "post" do
      assert_select "input#ingredient_size[name=?]", "ingredient[size]"
      assert_select "input#ingredient_recipe_id[name=?]", "ingredient[recipe_id]"
      assert_select "input#ingredient_product_id[name=?]", "ingredient[product_id]"
    end
  end
end
