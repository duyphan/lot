Feature: About
	@about
  Scenario: Viewing application's about page
    Given I am on the about page
    Then I should see "About"