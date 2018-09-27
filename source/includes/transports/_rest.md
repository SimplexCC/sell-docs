# REST #

### URL ###

* https only
* Base URL: `https://api.simplexcc.com/v1/:api-name?_partner=:partner&_apikey=:apikey&...`

Parameter names that start with `_` are special

### Auth ###

* query parameter "\apikey=...", or
* http header with key
* query parameter "\partner=..." AND query parameter "\jwt=", signed with your key

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

Simplex's API's are designed to be usable in environments with different capabilities. Such environments may or may not be:

 * Considered safe, and thus allowed to hold an API key.
 * Able to run code for generating requests and processing responses.
 * Able to expose REST endpoints for Simplex to invoke (to notify you when a transaction is approved, e.g.).

To that end it is possible to invoke the API's in several different ways. We call these ways **"Transports"**.


What changes between transports is the _how:_ how authentication is performed, how parameters are passed, how responses are received, and how errors are signalled.








[modeline]: # ( vim: set ts=2 sw=2 expandtab wrap linebreak: )
