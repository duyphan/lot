Feature: Manage Regions
  In order to make a web
  As an author
  I want to create and manage regions
  
  @region
  Scenario: Regions List
    Given I have "Regions" existed:
        | name          | portal_code     |
        | Mien Bac      | 1234            |
        | Mien Nam      | 1234            |
    When I go to the list of regions
    Then I should see "Mien Bac"
    And I should see "Mien Nam"
    
  @region
  Scenario: Create Valid Region
    Given I have no regions
    And I am on the list of regions
    When I follow "New"
    And I fill in "Name" with "Mien Bac"
    And I fill in "Portal code" with "123132"
    And I press "Create Region"
    Then I follow "Back"
    And I should see "Mien Bac"
    And I should see "123132"

  @region
  Scenario: Delete Region
    Given I have "Mien Bac" regions
    And I am on the list of regions
    When I follow "Delete"
    # When I confirm the browser dialog
    # Then I should see "Region was successfully destroyed."
