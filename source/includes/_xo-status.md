# xo-status #

A query from Simplex to you regarding the status of an execution order previously created by a `send-crypto` API.

Alternatively: a notification from you to Simplex that the status of an execution order has changed.

## Synopsis ##

Message name: **`xo-status`**  
Direction: **Simplex &rarr; You** (p/REST), or **You &rarr; Simplex** (MsgQueue)  
Transports: **p/REST, MsgQueue**

## Parameters ##

> Simplex querying you for the status of an execution order:

```json
{
  "xo_id": "xo:7791528",
}
```

> You notifying Simplex of an execution order status change:

```json
{
  "xo_id": "xo:7791528",
  "status": "completed",
}
```

Name   | Type   |   |
------ | ------ | - |
xo_id  | String | **required**
status | String | **required** (You &rarr; Simplex) / **missing** (Simplex &rarr; You)

### xo_id ###
#### (String, **required**)

The identifier of an execution order previously created by you in response to `send-crypto`.

### status ###
#### (String, **required** (you &rarr; Simplex) / **missing** (Simplex &rarr; you)

The status of the execution order.

One of { `"completed"`, `"failed"` }.

## Response ##

> You responding to a Simplex query:

```json
{
  "status": "completed",
}
```

Name   | Type
------ | ----
status | String

### status ###
#### (String)

The status of the execution order.

One of { `"completed"`, `"pending"`, `"failed"` }.

## Transports ##

### p/REST ###

<span class="http-verb http-get">GET</span>`https://${YOUR_API_URL}/xo-status/:xo-id`

### MsgQueue ###

You notify Simplex of an execution order status change by  
<span class="http-verb http-post">POST</span>`https://api.simplexcc.com/v1/q/xo-status`

You will not receive `"xo-status"` queries on the MsgQueue transport.

[modeline]: # ( vim: set ts=2 sw=2 expandtab wrap linebreak: )
