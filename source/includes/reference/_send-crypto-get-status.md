# send-crypto-get-status #

A query from Simplex to you regarding the status of an execution order previously created by you in response to a `send-crypto` API.

## Synopsis ##

Message name: **`send-crypto-get-status`**  
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

The identifier of an execution order previously created by you in response to `send-crypto`.

## Response ##

> Example: you responding to the Simplex query:

```json
{
  "status": "completed",
  "crypto_amount": 125000, // 0.125 BTC
  "blockchain_txn_hash": "f1eddb27fced47de0684f913714b43e589f23fbb9ef17ceaa9f75e290f1541af"
}
```

Name                | Type        |   |
------------------- | ----------- | - |
status              | String      | **required**
crypto_amount       | MoneyAmount | **required** if `status == "completed"`
blockchain_txn_hash | Id          | **required** if `status == "completed"`

### status ###
#### (String, **required**)

The status of the execution order.

One of { `"completed"`, `"pending"`, `"failed"` }.

### crypto_amount ###
#### (MoneyAmount, **required** if `status == "completed"`)

The actual amount sent. Must match `crypto_amount` from the message unless `reason == "refund"`, in which case you may, under previous agreement with Simplex, subtract a reasonable amount for the blockchain transaction fee.

### blockchain_txn_hash ###
#### (Id, **required** if `status == "completed"`)

The blockchain transaction hash of the transaction created by you in order to fulfill the `send-crypto` request.


## p/REST ##

If you respond with a `"pending"` status to a `send-crypto` API, and you supply a p/REST endpoint for this API, then in order to poll for the status of the execution order Simplex will use  
<span class="http-verb http-get">GET</span> `https://${YOUR_API_URL}/send-crypto-get-status`

## MsgQueue ##

Alternatively, you may receive this request as a message of type `"send-crypto-get-status"` in  
<span class="http-verb http-get">GET</span> `https://api.simplexcc.com/v1/msg`

You respond by  
<span class="http-verb http-post">POST</span> `https://api.simplexcc.com/v1/msg/:msg-id/response`

You will need to also acknowledge receipt of the message, by  
<span class="http-verb http-post">POST</span> `https://api.simplexcc.com/v1/msg/:msg-id/ack`

[modeline]: # ( vim: set ts=2 sw=2 expandtab wrap linebreak: )
