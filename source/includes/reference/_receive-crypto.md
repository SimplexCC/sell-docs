# receive-crypto #

A request from Simplex asking that you run checks before accepting cryptocurrency.
Apps will receive cryptocurrency in a BuyCrypto transaction, or as a refund in a SellCrypto transaction.
Liquidity partners will receive cryptocurrency in a SellCrypto transaction, or as a refund in a BuyCrypto transaction.

The cryptocurrency may or may not already be in the destination address; you should monitor the blockchain for a transaction with the specified destination address (a transaction which, as mentioned, may have already happened). Once you detect that blockchain transaction you may wish to run your own checks. We call such checks a "crypto-check" process.

Your response includes an identifier for the crypto-check process, which Simplex can use to query you about its status.

Your response also includes the actual amount you received.

The result of a crypto-check may be:

 * `"accept"` : you received the cryptocurrency, all your checks pass, and you wish to keep the cryptocurrency.

 * `"reject"` : you received the cryptocurrency but cannot keep it for various reasons, which you specify. For some reasons Simplex may have a "fix" (e.g. an expired quote can fixed by getting a new quote from you and getting the end-user's approval for the new quote), in which cases Simplex will send another `receive-crypto`. If Simplex does not have such a "fix" it will initiate a refund process (and ask you to `send-crypto`) and will subsequently cancel the transaction.

Unless you reply with an explicit `"accept"` to a crypto-check no settlement items will be created, and naturally you may not keep/liquidate the received cryptocurrency.

## Synopsis ##

API name: **`receive-crypto`**  
Direction: **Simplex &rarr; You**

## Parameters ##

> Example request:

```json
{
  "reason": "delivery",
  "txn_id": "af492cb2-5b07-4318-8ece-be34f479e23b",
  "user_id": "595b88bea687c5dd444f99e0004a45d3",
  "user_aka_ids": ["1504241c7d83476aa3adcd54e2272d25", "38b583c7ccd246ffaed4ab0232b71647"],
  "quote_id": "bb4fbdef-9abc-41c1-94d9-a670413c4d02",
  "crypto_currency": "BTC",
  "crypto_amount": 500000, // 0.5 BTC
  "destination_crypto_address": "1EmXYy57z71H8J5jrxXsdjuJXZnPZgHnjh"
}
```

Name                       | Type           |   |
-------------------------- | -------------- | - |
reason                     | String         | **required**
txn_id                     | Id             | **required**
user_id                    | Id             | **required**
user_aka_ids               | List<Id>       | **required**
account_id                 | Id             |
quote_id                   | Id             | **required**
crypto_currency            | CryptoCurrency | **required**
crypto_amount              | MoneyAmount    | **required**
destination_crypto_address | CryptoAddress  | **required**

### reason ###
#### (String, **required**)

The reason you are receiving cryptocurrency.

One of { `"delivery"`, `"refund"` }.

 * `"delivery"` : you are buying cryptocurrency: you are either the App (in a BuyCrypto transaction) or the Liquidity Receiver (in a SellCrypto transaction).

 * `"refund"` : the reverse of "delivery" -- we need to return to you, the original sender, cryptocurrency that you previously sent.

### txn_id ###
#### (Id, **required**)

The identifier of the Simplex transaction involved.

### user_id ###
#### (Id, **required**)

A unique identifier, created by Simplex, for the end-user performing the transaction.

Same `user_id` as a previous message means same end-user.

### user_aka_ids ###
#### (List<Id>, **required**)

A list of unique identifiers, on top of `user_id`, by which the user is also known.

### account_id ###
#### (Id, optional)

For wallets/exchanges: the end-user's account id in your system. This is what you sent Simplex in `initiate-sell`.

### quote_id ###
#### (Id, **required**)

The identifier of the quote on which this transaction is based.

### crypto_currency ###
#### (CryptoCurrency, **required**)

The crypto currency (the currency, not the amount) to be received.

This will match the quote's `quote_currency`, and is supplied as a convenience.

### crypto_amount ###
#### (MoneyAmount, **required**)

How much cryptocurrency of type `crypto_currency` is to be received.

This will match the quote, and is supplied as a convenience.

**Note:** you should always check the actual amount received, as well as report it back to Simplex. End-users' wallets may, for example, subtract a small "blockchain fee" to help the blockchain transaction go through quickly.

If the amount you receive is only slightly different, and you can still honor the quote's rate with the slightly different amount, then you should do so.

Otherwise, you may reply with an `"amount_mismatch"` to the crypto-check.

In any case, settlements between Simplex and you and always based on actual amounts received.

### destination_crypto_address ###
#### (CryptoAddress, **required**)

The crypto address to which the cryptocurrency will be sent.

This is an address you previously supplied Simplex in response to a `get-destination-crypto-address` message.

## Type CryptoCheck ###

Name                   | Type           |   |
---------------------- | -------------- | - |
id                     | Id             | **required**
status                 | String         | **required**
result                 | String         | **required** if `status == "completed"`, missing otherwise
crypto_amount_received | MoneyAmount    | **required** if `result == "success"`, may be present even otherwise
blockchain_txn_hash    | Id             | **required** if `status == "confirming"` or `result == "success"`

### id ###
#### (Id, **required**)

An opaque string generated by you and stored by Simplex.

You may use this identifier to notify Simplex of the status of the crypto-check process once it changes, and Simplex may use it identifier to query you for the same.

### status ###
#### (String, **required**)

One of { `"pending"`, `"confirming"`, `"completed"` }.

### result ###
#### (String, **required** if `status == "completed"`, missing otherwise)

One of { `"success"`, `"timeout"` }.

### crypto_amount_received ###
#### (MoneyAmount, **required** if `result == "success"`, may be present even otherwise)

The actual amount received.


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

Your response is a CryptoCheck object. If its status is `"pending"` you will need to later notify Simplex when the status changes to "completed". You do this using the `crypto-check-notify-status` message.

Alternatively, Simplex may poll you for the status, via either p/REST or MsgQueue, using `crypto-check-get-status`.

Name         | Type        |   |
------------ | ----------- | - |
crypto_check | CryptoCheck | **required**

## p/REST ##

If you supply a p/REST endpoint for this API, Simplex will use  
<span class="http-verb http-post">POST</span> `https://${YOUR_API_URL}/receive-crypto`

## MsgQueue ##

Alternatively, you may receive this request as a message of type `"receive-crypto"` in  
<span class="http-verb http-get">GET</span> `https://api.simplexcc.com/v3/msg`

You respond by  
<span class="http-verb http-post">POST</span> `https://api.simplexcc.com/v3/msg/:msg-id/response`

You will need to also acknowledge receipt of the message, by  
<span class="http-verb http-post">POST</span> `https://api.simplexcc.com/v3/msg/:msg-id/ack`

[modeline]: # ( vim: set ts=2 sw=2 expandtab wrap linebreak: )
