# get-destination-crypto-address #

A query from Simplex to you, asking where you would like cryptocurrency sent.

If you are:

 * The App (Wallet / Exchange / etc.) in a BuyCrypto transaction, _or_
 * The App (Wallet / Exchange / etc.) in a SellCrypto refund, _or_
 * The Liquidity Receiver in a SellCrypto transaction

... then we need to ask you where to send cryptocurrency.

In either case, you may choose any of the following:

 * The App may supply relevant destination crypto addresses as part of `initiate`.
 * Your Simplex account may have preconfigured destination crypto addresses.
 * We may get a bulk of destination addresses from you ahead of time.
 * We may ask you specifically per transaction.

Simplex uses `get-destination-crypto-address` for the latter two cases.

## Synopsis ##

API name: **`get-destination-crypto-address`**  
Direction: **Simplex &rarr; You**

## Parameters ##

> Example: Simplex querying you, ahead of time, for a bulk of addresses:

```json
{
  "reason": "delivery",
  "crypto_currency": "BTC",
  "n": 100
}
```

> Example: Simplex querying you for a destination crypto address for a specific transaction:

```json
{
  "txn_id": "af492cb2-5b07-4318-8ece-be34f479e23b",
  "reason": "delivery",
  "crypto_currency": "BTC",
  "n": 1
}
```

Name            | Type           |   |
--------------- | -------------- | - |
txn_id          | Id             |
reason          | String         | **required**
crypto_currency | CryptoCurrency | **required**
n               | Integer        | **required**

### txn_id ###
#### (Id, optional)

The identifier of the transaction for which the destination crypto address is requested.

If no specific transaction is involved (e.g. Simplex is asking for a bulk of addresses ahead of time), this will not be passed.

### reason ###
#### (String, **required**)

What the address will be used for.

One of { `"delivery"`, `"refund"` }.

 * `"delivery"` : you are buying cryptocurrency: either the App (in a BuyCrypto transaction) or a Liquidity Receiver (in a SellCrypto transaction)
 * `"refund"` : the reverse of "delivery" -- we are returning cryptocurrency that you have previously sent.

### crypto_currency ###
#### (CryptoCurrency, **required**)

The crypto currency (the currency, not the amount) that will be sent to the crypto address you supply.

### n ###
#### (Integer, **required**)

The number of requested destination crypto addresses.

## Response ##

> Example: you respond to the Simplex query:

```json
{
  "crypto_addresses": [ "1EmXYy57z71H8J5jrxXsdjuJXZnPZgHnjh" ]
}
```

Name             | Type                  |   |
---------------- | --------------------- | - |
crypto_addresses | List\<CryptoAddress\> | **required**

### crypto_addresses ###
#### (List\<CryptoAddress\>, **required**)

A list of destination crypto addresses.

## p/REST ##

If you supply a p/REST endpoint for this API, Simplex will use  
<span class="http-verb http-get">GET</span> `https://${YOUR_API_URL}/get-destination-crypto-address`

## MsgQueue ##

Alternatively, you may receive this request as a message of type `"get-destination-crypto-address"` in  
<span class="http-verb http-get">GET</span> `https://api.simplexcc.com/v1/msg`

You respond by  
<span class="http-verb http-post">POST</span> `https://api.simplexcc.com/v1/msg/:msg-id/response`

You will need to also acknowledge receipt of the message, by  
<span class="http-verb http-post">POST</span> `https://api.simplexcc.com/v1/msg/:msg-id/ack`

[modeline]: # ( vim: set ts=2 sw=2 expandtab wrap linebreak: )
