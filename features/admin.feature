Feature: Admin
  Scenario: Admin signs in
    Given the following admin:
      | email    | dl@example.com |
      | password | password          |
    And I am on the sign in page
    When I fill in the following:
      | email    | dl@example.com |
      | password | password          |
    And I press "sign in"
    Then I should be on the home page

  Scenario: Admin fails to sign in
    Given the following admin:
      | email    | dl@example.com |
      | password | password          |
    And I am on the sign in page
    When I fill in the following:
      | email    | dl@example.com |
      | password | dude bro          |
    And I press "sign in"
    Then I should be on the sign in page
