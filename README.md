# Timestamp Microservice

## Project aims
The Timestamp Microservice is a small project for Ruby on Rails, meant to
exercise proper development workflow (version control, integration unit testing,
etc).

## Functionality
The microservice features a single controller action that renders a JSON object
in response to GET requests to the homepage. If the request is accompanied by a
natural language date (in the correct format), or a unix timestamp, the JSON
object will contain a natural languge date and a unix timestamp for that date.
For any other paramter values, the response object will contain nulls.

## Example usage:
```
https://localhost:3000/December%2015,%202015
https://localhost:3000/1450137600
```
## Example output:
```{ "unix": 1450137600, "natural": "December 15, 2015" }```
