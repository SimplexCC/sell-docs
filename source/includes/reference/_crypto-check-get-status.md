# crypto-check-get-status #

A query from Simplex to you regarding the status of a crypto-check previously created by you (e.g. in response to `receive-crypto`).

## Synopsis ##

Message name: **`crypto-check-get-status`**  
Direction: **Simplex &rarr; You**

## Parameters ##

> Example: Simplex querying you for the status of a crypto-check:

```json
{
  "crypto_check_id": "da8f72d2-d1c6-4468-89da-37f6d87f0cdf"
}
```

Name            | Type |   |
--------------- | ---- | - |
crypto_check_id | Id   | **required**

### crypto_check_id ###
#### (Id, **required**)

The identifier of a crypto-check previously created by you (e.g. in response to `receive-crypto`).

## Response ##

> Example response:

```json
{
  "crypto_check": {
    "id": "da8f72d2-d1c6-4468-89da-37f6d87f0cdf",
    "status": "completed",
    "crypto_amount_received": 500000,
    "result": "reject",
    "reasons": ["amount_mismatch"]
  }
}
```

Please refer to the documentation in `receive-crypto` for a description of the CryptoCheck type.

Name         | Type        |   |
------------ | ----------- | - |
crypto_check | CryptoCheck | **required**

## p/REST ##

If you supply a p/REST endpoint for this API, then in order to poll for the status of crypto-checks Simplex will use  
<span class="http-verb http-get">GET</span> `https://${YOUR_API_URL}/crypto-check-get-status`

## MsgQueue ##

Alternatively, you may receive messages of type `"crypto-check-get-status"` in  
<span class="http-verb http-get">GET</span> `https://api.simplexcc.com/v1/msg`

You respond by  
<span class="http-verb http-post">POST</span> `https://api.simplexcc.com/v1/msg/:msg-id/response`

You will need to also acknowledge receipt of the message, by  
<span class="http-verb http-post">POST</span> `https://api.simplexcc.com/v1/msg/:msg-id/ack`

[modeline]: # ( vim: set ts=2 sw=2 expandtab wrap linebreak: )
