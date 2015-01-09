When(/^I follow "(.*?)"$/) do |link|
  click_link link
end

Then(/^I should see "(.*?)"$/) do |title|
  page.should have_content(title)
end

Then(/^I should not see "(.*?)"$/) do |name|
  page.should_not have_content(name)
end