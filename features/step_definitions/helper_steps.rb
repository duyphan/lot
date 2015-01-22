When(/^I follow "(.*?)"$/) do |link|
  click_link link
end

Then(/^I should see "(.*?)"$/) do |title|
  page.should have_content(title)
end

Then(/^I should not see "(.*?)"$/) do |name|
  page.should_not have_content(name)
end

Given(/^I am on the about page$/) do
  visit about_path
end

Given(/^I am on the contact page$/) do
  visit contact_path
end

Given(/^I am on the homepage$/) do
  visit root_path
end

Then(/^I should see the image "(.*?)"$/) do |image|
  page.should have_xpath("//img[@src=\"assets/style/images/art/#{image}\"]")
end

Then(/^I should see the search text box$/) do
  page.should have_css("input.search-submit-button")
end