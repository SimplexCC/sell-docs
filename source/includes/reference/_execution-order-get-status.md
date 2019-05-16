# execution-order-get-status #

A query from Simplex to you regarding the status of an execution order previously created by you (e.g. in response to `send-crypto`).

## Synopsis ##

Message name: **`execution-order-get-status`**  
Direction: **Simplex &rarr; You**

## Parameters ##

> Example: Simplex querying you for the status of an execution order:

```json
{
  "execution_order_id": "xo:7791528"
}
```

Name               | Type |   |
------------------ | ---- | - |
execution_order_id | Id   | **required**

### execution_order_id ###
#### (Id, **required**)

The identifier of an execution order previously created by you (e.g. in response to `send-crypto`).

## Response ##

> Example response:

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

## p/REST ##

If you supply a p/REST endpoint for this API, then in order to poll for the status of execution orders Simplex will use  
<span class="http-verb http-get">GET</span> `https://${YOUR_API_URL}/execution-order-get-status`

## MsgQueue ##

Alternatively, you may receive messages of type `"execution-order-get-status"` in  
<span class="http-verb http-get">GET</span> `https://api.simplexcc.com/v3/msg`

You respond by  
<span class="http-verb http-post">POST</span> `https://api.simplexcc.com/v3/msg/:msg-id/response`

You will need to also acknowledge receipt of the message, by  
<span class="http-verb http-post">POST</span> `https://api.simplexcc.com/v3/msg/:msg-id/ack`

[modeline]: # ( vim: set ts=2 sw=2 expandtab wrap linebreak: )
