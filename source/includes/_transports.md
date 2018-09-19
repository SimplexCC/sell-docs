# Transports #

* Construct a URL
* Build the request
* Interpret response
* Errors

## REST ##

Base URL: `https://api.simplexcc.com/v1/rest/:msg?_partner=:partner&_apikey=:apikey&...`

Parameter names that start with `_` are special

### GET ###

* message-name: part of URL
* auth: pass "\_partner=" and "\apikey=" query parameters
* parameters are passed as query parameters
* nested parameters are passed like `a.b`

### POST ###

* message-name: part of URL
* auth: pass "\_partner=" and "\apikey=" query parameters (??? - to make it same URL as GET)
* auth: pass "X-Auth" http header ???
* content-type: application/json
* post body: json object with parameters as keys

### Errors ###

TODO

## JWT ##

Base URL: `https://api.simplexcc.com/v1/jwt/:msg?_partner=:partner&jwt=:jwt`

Only GET

* message-name: part of URL
* auth: pass "\_partner=" query parameter, and sign JWT with api key
* parameters are passed JWT-encoded on the "jwt=" query parameter

### Errors ###

TODO

## Message Queue Polling ##

Base URL: `https://api.simplexcc.com/v1/q`

Auth: \_partner= and \_apikey= on URL ???

### Get messages ###

GET `/msg`

### ACK a message ###

PUT `/msg/:id`

### Post a message ###

POST `/msg`

### Errors ###

TODO
