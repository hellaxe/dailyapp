Given(/^I signed up as user$/) do
  user = User.last
end

When(/^I create product "(.*?)"$/) do |arg1|
  @product = Product.new
  @product.name = 'Banana'
end

When(/^calories of product is (\d+)$/) do |arg1|
  @product.calories = arg1
end

When(/^protein of product is (\d+)$/) do |arg1|
  @product.protein = arg1
end

When(/^carbohydrate of product is (\d+)$/) do |arg1|
  @product.carbohydrate = arg1
end

When(/^fat of product is (\d+)$/) do |arg1|
  @product.fat = arg1
end

When(/^I add product$/) do
  @product.save!
end

Then(/^I should see "(.*?)"$/) do |arg1|
  # TODO: Compare response and expectation
  response == arg1
end

