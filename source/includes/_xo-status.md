# xo-status #

A query from Simplex to you regarding the status of an execution order previously created by `send-crypto`.

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

Name   | Type   | Notes
------ | ------ | -----
xo_id  | String | **required**
status | String | **required** (you &rarr; Simplex) / **missing** (Simplex &rarr; you)

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

Name   | Type   | Notes
------ | ------ | -----
status | String |

### status ###
#### (String)

The status of the execution order.

One of { `"completed"`, `"pending"`, `"failed"` }.

## Transports ##

### p/REST ###

<span class="http-verb http-get">GET</span>`https://${YOUR_API_BASE_URL}/xo-status/:id`

### MsgQueue ###

[modeline]: # ( vim: set ts=2 sw=2 expandtab wrap linebreak: )
