When(/^I visit the homepage with a date parameter$/) do
  @date = Date.today.strftime("%B, %d, %Y")
  visit root_path(date: @date)
end

Then(/^it is converted to a timestamp$/) do
  expect(page).to have_content(Date.today.to_time.to_i)
end

When(/^I visit the homepage with a timestamp paramter$/) do
  @date = Date.today.to_time.to_i
  visit root_path(date: @date)
end

Then(/^it is converted to a date$/) do
  expect(page).to have_content(Date.today.strftime("%B, %d, %Y"))
end

When(/^I visit the homepage with an incorrect paramter$/) do
  @date = "svshdkjsdksjd"
  visit root_path(date: @date)
end

Then(/^receive null$/) do
  expect(page).to have_content('null')
end
