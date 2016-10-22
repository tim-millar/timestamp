Given(/^I visit the homepage$/) do
  visit root_path(date: @date)
end

When(/^I pass a date parameter$/) do
  @date = Date.today.strftime("%B%%20\%d%%20\%d")
end

Then(/^it is converted to a unix timestamp$/) do
  expect(response).to have_content(Date.today.to_time.to_i)
end

When(/^I pass a timestamp paramter$/) do
  @date = Date.today.to_time.to_i
end

Then(/^it is converted to a date$/) do
  expect(response).to have_content(Date.today.strftime("%B, %d, %Y"))
end

When(/^I pass an incorrect paramter$/) do
  @date = "svshdkjsdksjd"
end

Then(/^receive null$/) do
  expect(response).to have_content('null')
end
