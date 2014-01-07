Feature: Photos
  Scenario: User views photos
    Given I am on the home page
    When I follow "Photos"
    Then I should see at least one photo
