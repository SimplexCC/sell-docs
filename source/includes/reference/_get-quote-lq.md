# get-quote-lq #

A request from Simplex to you, asking you for a quote on a fiat/crypto rate.

When you are a "Liquidity Receiver" (i.e. you buy, and thus receive, cryptocurrency from end-users) or a "Liquidity Provider" (i.e. you sell, and thus provide, cryptocurrency to end-users) in a Simplex transaction, Simplex needs to ask you for the rate at which you are willing to buy/sell cryptocurrency. This is what the `get-quote-lq` API is for.

## Synopsis ##

API name: **`get-quote-lq`**  
Direction: **Simplex &rarr; You**

## Parameters ##

> The end-user wishes to sell you 0.5 BTC and wishes to know how many EUR they will get in exchange:

```json
{
  "src_currency": "BTC",
  "src_amount": 500000, // BTC 0.5
  "dst_currency": "EUR",
  "dst_amount": null,
}
```

> The end-user is asking how many BTC's they need to sell you in order to receive EUR 1,000:

```json
{
  "src_currency": "BTC",
  "src_amount": null,
  "dst_currency": "EUR",
  "dst_amount": 1000000000 // EUR 1,000.0
}
```

> The end-user wishes to buy 0.5 BTC from you and wishes to know how many USD they need for that:

```json
{
  "src_currency": "USD",
  "src_amount": null,
  "dst_currency": "BTC",
  "dst_amount": 500000 // BTC 0.5
}
```

> The end-user is asking how many BTC's they can receive for $16,000 USD:

```json
{
  "src_currency": "USD",
  "src_amount": 16000000000, // USD $16,000
  "dst_currency": "BTC",
  "dst_amount": null
}
```

Name         | Type        |   |
-------------| ----------- | - |
src_currency | Currency    | **required**
src_amount   | MoneyAmount | **required** if `dst_amount` is missing, or missing otherwise
dst_currency | Currency    | **required**
dst_amount   | MoneyAmount | **required** if `src_amount` is missing, or missing otherwise

### src_currency ###
#### (Currency, **required**)

The currency to convert from: this is the currency you are buying from the end-user.

### src_amount ###
#### (MoneyAmount, **required** if `dst_amount` is missing, or missing otherwise)

The amount of `src_currency` units, in millionths of a unit, the end-user wishes to sell.

If this is present then `dst_amount` is missing, and the end-user is asking how many `dst_currency` units they will receive for selling you `src_amount` units of `src_currency`.

If this is missing then `dst_amount` is present, and the end-user is asking many `src_currency` units they need to sell you in order to receive `dst_amount` units of `dst_currency`.

### dst_currency ###
#### (Currency, **required**)

The currency to convert to: this is the currency the end-user wishes to receive.

If `src_currency` represents a fiat currency then `dst_currency` will represent a crypto currency, and vise versa.

### dst_amount ###
#### (MoneyAmount, **required** if `src_amount` is missing, or missing otherwise)

The amount of `dst_currency` units, in millionths of a unit, the end-user wishes to receive.

If this is present then `src_amount` is missing, and the end-user is asking how many `dst_currency` units they need to sell you in order to receive `dst_amount` units of `dst_currency`.

If this is missing then `src_amount` is present, and the end-user is asking many `dst_currency` units they will receive for selling you `src_amount` units of `src_currency`.

## Response ##

> An example response:

```json
{
    "quote_id": "bb4fbdef-9abc-41c1-94d9-a670413c4d02",
    "rate": 8000
}
```

Name     | Type
-------- | ----
quote_id | Id
rate     | Float

### quote_id ###
#### (Id)

An identifier for this quote. Simplex will use this identifier when referencing this particular quote in subsequent API's.

### rate ###
#### (Float)

The exchange rate: how many units of `dst_currency` will you pay for one unit of `src_currency`.

The rate provided may take the amount into consideration: Simplex will use this rate for this particular quote only, and will not assume that the rate holds for different amounts.

## p/REST ##

If you supply a p/REST endpoint for this API, Simplex will use  
<span class="http-verb http-get">GET</span> `https://${YOUR_API_URL}/get-quote-lq`

## MsgQueue ##

Alternatively, you may receive this request as a message of type `"get-quote-lq"` in  
<span class="http-verb http-get">GET</span> `https://api.simplexcc.com/v1/msg`

You respond by  
<span class="http-verb http-post">POST</span> `https://api.simplexcc.com/v1/msg/:msg-id/response`

You will need to also acknowledge receipt of the message, by  
<span class="http-verb http-post">POST</span> `https://api.simplexcc.com/v1/msg/:msg-id/ack`

[modeline]: # ( vim: set ts=2 sw=2 expandtab wrap linebreak: )
