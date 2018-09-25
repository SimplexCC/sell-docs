# get-dst-crypto-addr #

A query from Simplex to you, asking where you would like crypto currencies sent to.

If you are the entity:

 * Representing the end-user in a BuyCrypto  transaction (a wallet application, an exchange, etc.), OR
 * (In case of a refund) Representing the end-user in a SellCrypto transaction (a wallet application, an exchange, etc.), OR
 * Buying crypto currencies from end-users in a SellCrypto transaction (a "Liquidity Receiver")
... then we need to know where to send the crypto currencies to.

In all cases, you may choose any of the following:
 * If you are the entity initiating the Simplex transaction (a wallet application, an exchange, etc.), send the relevant destination crypto address as part of `initiate`
 * Use a pre-configured crypto address
 * We may get a bulk of destination addresses from you ahead of time
 * We may ask you specifically per transaction

`get-dst-crypto-addr` is used by Simplex for the latter two cases.

## Synopsis ##

API name: **`get-dst-crypto-addr`**  
Direction: **Simplex &rarr; You**  
Transports: **p/REST, MsgQueue**

## Parameters ##

> Simplex querying you ahead of time for a bulk of addresses:

```json
{
  "crypto_currency": "BTC",
  "n": 100,
}
```

> Simplex querying you for a destination crypto address for a specific transaction:

```json
{
  "txn_id": "af492cb2-5b07-4318-8ece-be34f479e23b",
  "reason": "buy",
  "crypto_currency": "BTC",
  "n": 1,
}
```

Name            | Type           | Notes
--------------- | -------------- | -----
txn_id          | Id             |
reason          | String         | **required**
crypto_currency | CryptoCurrency | **required**
n               | Integer        | **required**

### txn_id ###
#### (Id, optional)

The identifier of the Simplex transaction for which the destination crypto address is requested.

If no specific transaction is involved (e.g. Simplex is asking for a bulk of addresses ahead of time), this will not be passed.

### reason ###
#### (String, **required**)

What the address will be used for.

One of { `"delivery"`, `"refund"` }.

 * `"delivery"`: you are buying the crypto currency to be received. You are either a Liquidity Receiver in a SellCypto transaction, or a wallet/exchange/etc. in a BuyCrypto transaction.
 * `"refund"`: the reverse of "delivery" -- we want to return crypto currencies that you have previously sent.

### crypto_currency ###
#### (CryptoCurrency, **required**)

The type of crypto currencies that will be sent to the crypto address you supply.

### n ###
#### (Integer, **required**)

The number of requested destination crypto addresses.

## Response ##

> You responding to a Simplex query:

```json
{
  "crypto_addrs": [ "1EmXYy57z71H8J5jrxXsdjuJXZnPZgHnjh" ],
}
```

Name         | Type               | Notes
------------ | ------------------ | -----
crypto_addrs | List\<CryptoAddr\> |

### crypto_addrs ###
#### (List\<CryptoAddr\>)

An list of destination crypto addresses.

## Transports ##

### p/REST ###

<span class="http-verb http-get">GET</span>`https://${YOUR_API_BASE_URL}/get-dst-crypto-addr`

### MsgQueue ###

[modeline]: # ( vim: set ts=2 sw=2 expandtab wrap linebreak: )
