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
    And I should see "sign out"

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

  Scenario: Admin signs out
    Given I am signed in
    When I follow "sign out"
    Then I should be on the sign in page
