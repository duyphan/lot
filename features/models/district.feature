Feature: Home page
	In order to make a web
  As an author
  I want to create and manage district
  
  @district
  Scenario: Districts List
    Given I have districts named Hue, Da Nang
    When I go to the list of districts
    Then I should see "Hue"
    And I should see "Da Nang"
    
  @district
  Scenario: Create Valid District
    Given I have no districts
    And I am on the list of districts
    When I follow "New"
    And I fill in "Name" with "Hue"
    And I fill in "Zip code" with "0542"
    And I fill in "Portal Code" with "054"
    And I press "Create District"
    Then I follow "Back"
    And I should see "Hue"
    And I should see "0542"
    And I should see "054"

  @district
  Scenario: Delete District
    Given I have "Hue" district
    And I am on the list of districts
    When I follow "Delete"