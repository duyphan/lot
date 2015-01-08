Given(/^I have districts named (.+)$/) do |names|
	region = FactoryGirl.create(:region)
  names.split(', ').each do |name|
    FactoryGirl.create(:district, name: name, region: region)
  end
end

When(/^I go to the list of districts$/) do
  visit districts_path
end

Given(/^I have no districts$/) do
  Region.delete_all
end

Given(/^I am on the list of districts$/) do
  visit districts_path
end

Given(/^I have "(.*?)" district$/) do |name|
  region = FactoryGirl.create(:region)
  FactoryGirl.create(:district, name: name, region: region)

  District.find_by_name(name) != nil
end