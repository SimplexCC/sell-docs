# API Transports #

* Construct a URL
* Build the request
* Interpret response
* Errors

## REST ##

Base URL: `https://api.simplexcc.com/v1/rest/:msg?_partner=:partner&_apikey=:apikey&...`

Parameter names that start with `_` are special

### Responses ###

### GET ###

* api-name: part of URL
* auth: pass "\_partner=" and "\apikey=" query parameters
* parameters are passed as query parameters
* nested parameters are passed like `a.b`

### POST ###

* api-name: part of URL
* auth: pass "\_partner=" and "\apikey=" query parameters (??? - to make it same URL as GET)
* auth: pass "X-Auth" http header ???
* content-type: application/json
* post body: json object with parameters as keys

### Errors ###

TODO

## JWT ##

Base URL: `https://api.simplexcc.com/v1/jwt?_partner=:partner&jwt=:jwt`

Only GET

* api-name: pass in JWT as "_msg_name="
* auth: pass "\_partner=" query parameter, and sign JWT with api key
* parameters are passed JWT-encoded on the "jwt=" query parameter

### Errors ###

TODO

## p/REST ##

You provide a BASE_URL, and we invoke methods.

* https only
* auth is a query parameter

### GET ###

### POST ###

### Responses ###

You responsd synchronously, in the body of the POST reply.

### Errors ###

## MsgQueue ##

Base URL: `https://api.simplexcc.com/v1/q`

Auth: \_partner= and \_apikey= on URL ???

### Get messages ###

GET `/msg`

### ACK a message ###

POST `/msg/:id/ack`

### Respond to a previous message ###

POST `/msg/:id/response`

### Send a message ###

POST `/msg/:msg-name`

### Errors ###

TODO

You receive the request as a message of type `get-dst-crypto-addr` in

<span class="http-verb http-get">GET</span>`https://api.simplexcc.com/v1/q/msg`

You respond by

<span class="http-verb http-post">POST</span>`https://api.simplexcc.com/v1/q/msg/:msg-id/response`

Don't forget to also acknowledge the receipt of the message, by

<span class="http-verb http-post">POST</span>`https://api.simplexcc.com/v1/q/msg/:msg-id/ack`

[modeline]: # ( vim: set ts=2 sw=2 expandtab wrap linebreak: )
