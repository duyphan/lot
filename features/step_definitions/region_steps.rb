Given(/^I have regions titled (.+)$/) do |titles|
  titles.split(', ').each do |name|
    Region.create!(:name => name)
  end
end

Given(/^I have no regions$/) do
  Region.delete_all
end

Then(/^I should have ([0-9]+) regions?$/) do |count|
  Region.count.should == count.to_i
end

Given(/^I am on the list of regions$/) do
  visit regions_path
end

When(/^I follow "(.*?)"$/) do |link|
  click_link link
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |arg1, arg2|
  fill_in arg1, :with => arg2
end

When(/^I press "(.*?)"$/) do |btn|
  click_button btn
end

When(/^I go to the list of regions$/) do
  visit regions_path
end

Given(/^I have "(.*?)" regions$/) do |name|
	Region.create!(:name => name)
  Region.find_by_name(name) != nil
end

When(/^I confirm the browser dialog$/) do
  page.driver.browser.switch_to.alert.accept
end

Then(/^I should not see "(.*?)"$/) do |name|
  page.should_not have_content(name)
end