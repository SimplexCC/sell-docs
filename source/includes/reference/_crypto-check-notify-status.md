# crypto-check-notify-status #

A notification, from you to Simplex, that the status of a crypto-check has changed.

## Synopsis ##

Message name: **`crypto-check-notify-status`**  
Direction: **You &rarr; Simplex**

## Parameters ##

> Example: you notifying Simplex of a crypto-check status change:

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

## Response ##

No response is generated.

## REST ##

<span class="http-verb http-post">POST</span> `https://api.simplexcc.com/v3/crypto-check-notify-status`

[modeline]: # ( vim: set ts=2 sw=2 expandtab wrap linebreak: )
