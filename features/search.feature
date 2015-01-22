Feature: Search

	Background:
    Given the following articles exist:
    | title        | description               |    
    | Pick up milk | email: person@example.com |
    | Pick up eggs | email: person@example.com |

	@search
  Scenario: Viewing form search box on layout
    Given I am on the homepage
    Then I should see "Search"
    And I should see the search text box

  @search @wip
  Scenario: Search with no valid search key
  	Given I am home page
  	And I want to search with " "
  	Then I should see "Invalid key search"

  @search @wip
  Scenario: Search with valid search key and have result
  	Given I am home page
  	And I want to search with "Pick"
  	Then I should see "Pick"

  @search @wip
  Scenario: Search with valid search key and have no result
  	Given I am home page
  	And I want to search with "Pick All"
  	Then I should see "No result"