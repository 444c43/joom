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

  Scenario: Admin adds post
    Given I am signed in
    When I follow "+ add post"
    And I fill in "post_body" with "this is a post"
    And I check "publish?"
    And I press "add post"
    Then I should see "this is a post"
