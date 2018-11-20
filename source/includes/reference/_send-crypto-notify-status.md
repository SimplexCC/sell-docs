# send-crypto-notify-status #

A notification, from you to Simplex, that the status of an execution order has changed.

## Synopsis ##

Message name: **`send-crypto-notify-status`**  
Direction: **You &rarr; Simplex**

## Parameters ##

> Example: you notifying Simplex of an execution order status change:

```json
{
  "execution_order_id": "xo:7791528",
  "status": "completed",
  "crypto_amount": 125000, // 0.125 BTC
  "blockchain_txn_hash": "f1eddb27fced47de0684f913714b43e589f23fbb9ef17ceaa9f75e290f1541af"
}
```

Name                | Type        |   |
------------------- | ----------- | - |
execution_order_id  | Id          | **required**
status              | String      | **required**
crypto_amount       | MoneyAmount | **required** if `status == "completed"`
blockchain_txn_hash | Id          | **required** if `status == "completed"`

### execution_order_id ###
#### (Id, **required**)

The identifier of an execution order previously created by you in response to `send-crypto`.

### status ###
#### (String, **required**)

The status of the execution order.

One of { `"completed"`, `"failed"` }.

### crypto_amount ###
#### (MoneyAmount, **required** if `status == "completed"`)

The actual amount sent. Must match `crypto_amount` from the message unless `reason == "refund"`, in which case you may, under previous agreement with Simplex, subtract a reasonable amount for the blockchain transaction fee.

### blockchain_txn_hash ###
#### (Id, **required** if `status == "completed"`)

The blockchain transaction hash of the transaction created by you in order to fulfill the `send-crypto` request.

## Response ##

No response is generated.

## REST ##

<span class="http-verb http-post">POST</span> `https://api.simplexcc.com/v1/send-crypto-notify-status`

[modeline]: # ( vim: set ts=2 sw=2 expandtab wrap linebreak: )
