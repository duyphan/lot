Given(/^I am on the homepage$/) do
  visit root_path
end

Then(/^I should see the "(.*?)" post$/) do |title|
  page.should have_content(title)
end