# get-xo-status #

A query from Simplex to you regarding the status of an execution order previously created by you in response to a `send-crypto` API.

## Synopsis ##

Message name: **`get-xo-status`**  
Direction: **Simplex &rarr; You**

## Parameters ##

> Simplex querying you for the status of an execution order:

```json
{
  "xo_id": "xo:7791528"
}
```

Name   | Type   |   |
------ | ------ | - |
xo_id  | String | **required**

### xo_id ###
#### (String, **required**)

The identifier of an execution order previously created by you in response to `send-crypto`.

## Response ##

> You responding to a Simplex query:

```json
{
  "status": "completed"
}
```

Name   | Type
------ | ----
status | String

### status ###
#### (String)

The status of the execution order.

One of { `"completed"`, `"pending"`, `"failed"` }.

## p/REST ##

If you respond with a `"pending"` status to a `send-crypto` API, and you supply a p/REST endpoint for this API, then in order to poll for the status of the execution order Simplex will use  
<span class="http-verb http-get">GET</span>`https://${YOUR_API_URL}/get-xo-status`

## MsgQueue ##

Alternatively, you may receive this request as a message of type `"get-xo-status"` in  
<span class="http-verb http-get">GET</span>`https://api.simplexcc.com/v1/msg`

You respond by  
<span class="http-verb http-post">POST</span>`https://api.simplexcc.com/v1/msg/:msg-id/response`

You will need to also acknowledge receipt of the message, by  
<span class="http-verb http-post">POST</span>`https://api.simplexcc.com/v1/msg/:msg-id/ack`

[modeline]: # ( vim: set ts=2 sw=2 expandtab wrap linebreak: )
