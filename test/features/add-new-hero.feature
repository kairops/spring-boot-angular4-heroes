Feature: Test the add records capability

Scenario: Add new hero to the database
  Given I am on the home page of the heroes application
   When I select the "Heroes" link
   Then I should see "My Heroes"
    And I should see "Dr IQ"
  # ToDo: the app should answer to this request
