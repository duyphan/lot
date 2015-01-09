Given(/^I do not exist as a user$/) do
  create_visitor
  delete_user
end

When(/^I sign in with valid credentials$/) do
  create_visitor
  sign_in
end

Then(/^I see an invalid login message$/) do
  page.should have_content "Email or password is invalid."
end

Then(/^I should be signed out$/) do
  page.should have_content "Log In"
  page.should_not have_content "Log Out"
end

Given(/^I exist as a user$/) do
  create_user
end

Given(/^I am not logged in$/) do
  visit '/users/sign_out'
end

Then(/^I see a successful sign in message$/) do
  page.should have_content "Signed in successfully."
end

When(/^I return to the site$/) do
  visit '/'
end

Then(/^I should be signed in$/) do
  page.should have_content "Log Out"
  page.should_not have_content "Log In"
end

When(/^I sign in with a wrong email$/) do
  @visitor = @visitor.merge(:email => "wrong@example.com")
  sign_in
end

When(/^I sign in with a wrong password$/) do
  @visitor = @visitor.merge(:password => "wrongpass")
  sign_in
end

Given(/^I am logged in$/) do
  create_user
  sign_in
end

When(/^I sign out$/) do
  visit '/logout'
end

Then(/^I should see a signed out message$/) do
  page.should have_content "Signed out successfully."
end

When(/^I sign up with valid user data$/) do
  create_visitor
  sign_up
end

Then(/^I should see a successful sign up message$/) do
  page.should have_content "Welcome! You have signed up successfully."
end

When(/^I sign up with an invalid email$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see an invalid email message$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I sign up without a password$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see a missing password message$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I sign up without a password confirmation$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see a missing password confirmation message$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I sign up with a mismatched password confirmation$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see a mismatched password message$/) do
  pending # express the regexp above with the code you wish you had
end