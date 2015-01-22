Feature: About
	@about
  Scenario: Viewing application's about page
    Given I am on the about page
    Then I should see "About"
    And I should see the image "about-1.jpg" 