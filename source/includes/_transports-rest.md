# REST #

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

[modeline]: # ( vim: set ts=2 sw=2 expandtab wrap linebreak: )
