Feature: Timestamp Microservice

  So that I can convert unix timestamps to natural language dates & vice versa.

  Scenario: Convert unix timestamps to dates
    Given I visit the homepage
    When I pass a timestamp paramter
    Then it is converted to a unix timestamp

  Scenario: Convert dates to unix timestamps
    Given I visit the homepage
    When I pass a date parameter
    Then it is converted to a date

  Scenario: Return null if string is not a date
    Given I visit the homepage
    When I pass an incorrect paramter
    Then receive null
