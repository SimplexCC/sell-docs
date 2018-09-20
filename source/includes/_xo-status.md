# xo-status #

A query from Simplex about the status of an execution order previously created by `send-crypto`.

Alternatively: a notification from you to Simplex that the status of an execution order has changed.

## Synopsis ##

Message name: **`xo-status`**  
Direction: **Simplex &rarr; You** (Partner REST), or **You &rarr; Simplex** (Message Queue)  
Transports: **Partner REST, Message Queue**

## Parameters ##

> Simplex querying you for the status of an execution order:

```javascript--json
{
  "xo_id": "xo:7791528",
}
```

> You notifying Simplex of an execution order status change:

```javascript--json
{
  "xo_id": "xo:7791528",
  "status": "completed",
}
```

Name | Type | Required?
---- | ---- | ---------
xo_id | string | required
status | string | required when you notify Simplex, missing when Simplex queries you

### xo_id ###
#### (string, required)

The id of an execution order previously created by you in response to `send-crypto`.

### status ###
#### (string, required when you notify Simplex, missing when Simplex queries you)

The status of the execution order.

One of { `"completed"`, `"failed"` }.

## Response ##

> You responding to a Simplex query:

```javascript--json
{
  "status": "completed",
}
```

Name | Type
---- | ----
status | string

### status ###
#### (string)

The status of the execution order.

One of { "completed", "failed", "pending" }.

## Transports ##

### Partner REST ###

<span class="http-verb http-get">GET</span>`https://${YOUR_API_BASE_URL}/xo-status/:xo-id`

### Message Queue ###

[modeline]: # ( vim: set ts=2 sw=2 expandtab wrap linebreak: )
