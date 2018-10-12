# send-crypto-notify-status #

A notification, from you to Simplex, that the status of an execution order has changed.

## Synopsis ##

Message name: **`send-crypto-notify-status`**  
Direction: **You &rarr; Simplex**

## Parameters ##

> You notifying Simplex of an execution order status change:

```json
{
  "xo_id": "xo:7791528",
  "status": "completed"
}
```

Name   | Type   |   |
------ | ------ | - |
xo_id  | String | **required**
status | String | **required**

### xo_id ###
#### (String, **required**)

The identifier of an execution order previously created by you in response to `send-crypto`.

### status ###
#### (String, **required**)

The status of the execution order.

One of { `"completed"`, `"failed"` }.

## Response ##

No response is generated.

## REST ##

<span class="http-verb http-post">POST</span> `https://api.simplexcc.com/v1/send-crypto-notify-status`

[modeline]: # ( vim: set ts=2 sw=2 expandtab wrap linebreak: )
