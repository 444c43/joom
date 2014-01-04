Feature: Posts
  Scenario: Visitor views a published posts
    Given the following post:
      | body      | This is the body of a post. You better read it |
      | published | true                                           |
    When I am on the home page
    And I follow "Blog"
    Then I should see "This is the body of a post. You better read it"

  Scenario: Visitor doesn't see unpublished posts
    Given the following post:
      | body      | This is the body of a post. You better read it |
      | published | false                                          |
    When I am on the home page
    And I follow "Blog"
    Then I should not see "This is the body of a post. You better read it"
