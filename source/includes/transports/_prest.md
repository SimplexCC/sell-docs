# p/REST #

## Base URL ##

The base URL for REST endpoints you provide for Simplex to invoke is configured in your Simplex account, and is referred to in this document as `${YOUR_API_URL}`.

<aside class="warning">
Simplex will only ever make HTTPS requests, never HTTP.
</aside>

## Authentication ##

You provide Simplex with a p/REST API key of your own, which Simplex will include as the query parameter `"_auth"` in all p/REST API calls it makes.

> Exapmle:

```bash
curl \
  'https://${YOUR_API_URL}/send-coins?_auth=f16b16926976411a8917de3f50c825a4&...'
```

## Parameters ##

The same semantics hold here as when you invoke Simplex REST API's.

Simplex will pass parameters to p/REST API's using a `Content-Type` of `"application/json"` and using a JSON object in the request body in POST requests, and will use query parameters in GET requests.

## Response ##

The same semantics hold here as when you invoke Simplex REST API's.

HTTP responses are expected to have a `Content-Type` set to `"application/json"` and contain a JSON object in the response body.

## Errors ##

The same semantics hold here as when you invoke Simplex REST API's.

Successful p/REST API calls are expected to return a `200 OK` HTTP status code, while errors are to be signalled with an appropriate HTTP status code and the presence of an `_error` top-level field in the JSON response body.

[modeline]: # ( vim: set ts=2 sw=2 expandtab wrap linebreak: )
