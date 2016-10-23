Feature: Timestamp Microservice

  So that I can convert unix timestamps to natural language dates & vice versa.

  Scenario: Convert dates to unix timestamps
    When I visit the homepage with a date parameter
    Then it is converted to a timestamp

  Scenario: Convert unix timestamps to dates
    When I visit the homepage with a timestamp paramter
    Then it is converted to a date

  Scenario: Return null if string is not a date
    When I visit the homepage with an incorrect paramter
    Then receive null
