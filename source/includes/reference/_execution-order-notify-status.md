# execution-order-notify-status #

A notification, from you to Simplex, that the status of an execution order has changed.

## Synopsis ##

Message name: **`execution-order-notify-status`**  
Direction: **You &rarr; Simplex**

## Parameters ##

> Example: you notifying Simplex of an execution order status change:

```json
{
  "execution_order": {
    "id": "xo:7791528",
    "status": "completed",
    "crypto_amount_sent": 125000, // 0.125 BTC
    "blockchain_txn_hash": "f1eddb27fced47de0684f913714b43e589f23fbb9ef17ceaa9f75e290f1541af"
  }
}
```

Please refer to the documentation in `send-crypto` for a description of the ExecutionOrder type.

Name            | Type           |   |
--------------- | -------------- | - |
execution_order | ExecutionOrder | **required**

## Response ##

No response is generated.

## REST ##

<span class="http-verb http-post">POST</span> `https://api.simplexcc.com/v3/execution-order-notify-status`

[modeline]: # ( vim: set ts=2 sw=2 expandtab wrap linebreak: )
