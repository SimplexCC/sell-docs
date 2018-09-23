# get-dst-crypto-addr #

A query from Simplex to you, asking where you would like your crypto currencies sent to.

If you are the entity:

 * Representing the end-user in a BuyCrypto  transaction (a wallet application, an exchange, etc.), OR
 * (In case of a refund) Representing the end-user in a SellCrypto transaction (a wallet application, an exchange, etc.), OR
 * Buying crypto currencies from end-users in a SellCrypto transaction (a "Liquidity Receiver")
... then we need to know where to send your crypto currencies to.

In all cases, you may choose any of the following:
 * If you are the entity initiating the Simplex transaction (a wallet application, an exchange, etc.), send the relevant destination crypto address as part of `initiate`
 * Use a pre-configured crypto address
 * We may get a bulk of destination addresses from you ahead of time
 * We may ask you specifically per transaction

`get-dst-crypto-addr` is used by Simplex for the latter two cases.

## Synopsis ##

Message name: **`get-dst-crypto-addr`**  
Direction: **Simplex &rarr; You**  
Transports: **Partner REST, Message Queue**

## Parameters ##

> Simplex querying you ahead of time for a bulk of addresses:

```json
{
  "currency": "BTC",
  "n": 100,
}
```

> Simplex querying you for a destination crypto address for a specific transaction:

```json
{
  "txn_id": "af492cb2-5b07-4318-8ece-be34f479e23b",
  "reason": "buy",
  "currency": "BTC",
  "n": 1,
}
```

Name | Type | Required?
---- | ---- | ---------
txn_id | id | optional
reason | string | required
currency | crypto_currency | required
n | integer | required

### txn_id ###
#### (id, optional)

The identifier of the Simplex transaction for which the destination crypto address is requested.

If no specific transaction is involved (e.g. Simplex is asking for a bulk of addresses ahead of time), this will not be passed.

### reason ###
#### (string, **required**)

What the address will be used for.

One of { `"delivery"`, `"refund"` }.

 * `"delivery"`: you are buying the crypto currency to be received. You are either a Liquidity Receiver in a SellCypto transaction, or a wallet/exchange/etc. in a BuyCrypto transaction.
 * `"refund"`: the reverse of "delivery" -- we want to return crypto currencies that you have previously sent.

### currency ###
#### (crypto_currency, **required**)

The type of crypto currencies that will be sent to the crypto address you supply.

### n ###
#### (integer, **required**)

The number of requested destination crypto addresses.

## Response ##

> You responding to a Simplex query:

```json
{
  "crypto_addrs": [ "1EmXYy57z71H8J5jrxXsdjuJXZnPZgHnjh" ],
}
```

Name | Type
---- | ----
crypto_addrs | Array<string>

### crypto_addrs ###
#### (Array<string>)

An array of strings, each representing a destination crypto address.

## Transports ##

### Partner REST ###

<span class="http-verb http-get">GET</span>`https://${YOUR_API_BASE_URL}/get-dst-crypto-addr`

### Message Queue ###

[modeline]: # ( vim: set ts=2 sw=2 expandtab wrap linebreak: )
