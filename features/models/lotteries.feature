Feature: Manage Lotteries
  In order to make a web
  As an author
  I want to create and manage lotteries

  @lottery
  Scenario: Lotteries List
    When I go to the list of lotteries
    Then I should see "Lotteries List"