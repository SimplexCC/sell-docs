# Overview #

## Base URL ##

The base URL for Simplex API's is:

`https://api.simplexcc.com/v1`

## Authentication ##

All API's must be authenticated. To authenticate, supply your API key as the value of either the `_apikey` query parameter or the `X-Simplex-Auth` HTTP header.

> Using a query parameter:

```bash
curl \
  'https://api.simplexcc.com/v1/get-quote?_apikey=8d20e7bd89064cd4a9c379d66c53efc8&...'
```

> Using an HTTP header:

```bash
curl \
  -H 'X-Simplex-Auth: 8d20e7bd89064cd4a9c379d66c53efc8' \
  'https://api.simplexcc.com/v1/get-quote?...'
```

## Parameters ##

For API's that use POST, set the request's `Content-Type` header to `"application/json"` and supply an appropriate JSON object in the request body.

> Example:

```bash
curl \
  -X POST \
  -H 'Content-Type: application/json' \
  -H 'X-Simplex-Auth: 8d20e7bd89064cd4a9c379d66c53efc8' \
  -d '{"xo_id": "xo:7791528", "status": "completed"}' \
  'https://api.simplexcc.com/v1/xo-status-notify'
```

For API's that use GET, specify each request parameter as a properly-escaped query parameter.

> Example:

```bash
curl \
  -H 'X-Simplex-Auth: 8d20e7bd89064cd4a9c379d66c53efc8' \
  'https://api.simplexcc.com/v1/get-quote?src_currency=EUR&src_amount=100000000&dst_currency=BTC'
```

## Response ##

All responses have their `Content-Type` set to `"application/json"`, and contain the response JSON object in the response body.

When an API has no response an empty HTTP response is returned.

> Example response:

```bash
$ curl \
  -i \
  -H 'X-Simplex-Auth: 8d20e7bd89064cd4a9c379d66c53efc8' \
  'https://api.simplexcc.com/v1/get-quote?src_currency=EUR&src_amount=100000000&dst_currency=BTC'
```
```
HTTP/1.1 200 OK
Content-Type: application/json

{
    "quote_id": "4c52ecda-e40e-4f94-89da-adc4e2e78b45",
    "rate": 8000.5
}
```

## Errors ##

Successful requests return `200 OK` HTTP status.

On error, the following HTTP status codes may be returned:

Status Code        | Description
------------------ | -----------
`400 Bad Request`  | Invalid request (e.g. invalid parameters)
`401 Unauthorized` | Missing or invalid API key
`404 Not Found`    | Invalid URL

On error, reponse will include an `_error` top-level field with a short error message. That error message is for debugging purposes only and is not meant to be displayed to end-users.

Successful requests do not return an `_error` field.

> Example error response:

```bash
$ curl \
  -i \
  -H 'X-Simplex-Auth: BAD_API_KEY' \
  'https://api.simplexcc.com/v1/get-quote?src_currency=EUR&src_amount=100000000&dst_currency=BTC'
```
```
HTTP/1.1 401 Unauthorized
Content-Type: application/json

{
    "_error": "Invalid API key"
}
```

> Another example error response:

```bash
$ curl \
  -i \
  -H 'X-Simplex-Auth: 8d20e7bd89064cd4a9c379d66c53efc8' \
  'https://api.simplexcc.com/v1/get-quote?src_currency=GOLD&src_amount=100000000&dst_currency=BTC'
```
```
HTTP/1.1 400 Bad Request
Content-Type: application/json

{
    "_error": "Invalid src_currency"
}
```

[modeline]: # ( vim: set ts=2 sw=2 expandtab wrap linebreak: )
