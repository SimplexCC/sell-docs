# get-quote-lq #

A request from Simplex to you, asking you for a quote on a fiat/crypto rate.

When you are a "Liquidity Receiver" (i.e. you buy, and thus receive, cryptocurrency from end-users) or a "Liquidity Provider" (i.e. you sell, and thus provide, cryptocurrency to end-users) in a Simplex transaction, Simplex needs to ask you for the rate at which you are willing to buy/sell cryptocurrency. This is what the `get-quote-lq` API is for.

## Synopsis ##

API name: **`get-quote-lq`**  
Direction: **Simplex &rarr; You**

## Parameters ##

> Example: the end-user wishes to sell 0.5 BTC and wishes to know how many EUR they will get in exchange:

```json
{
  "base_currency": "BTC",
  "base_amount": 500000, // BTC 0.5
  "quote_currency": "EUR"
}
```

> Example: the end-user is asking how many BTC's they need to sell in order to receive EUR 1,000:

```json
{
  "base_currency": "BTC",
  "quote_currency": "EUR",
  "quote_amount": 1000000000 // EUR 1000.0
}
```

> Example: the end-user wishes to buy 0.5 BTC and wishes to know how many USD they need to sell for that:

```json
{
  "base_currency": "USD",
  "quote_currency": "BTC",
  "quote_amount": 500000 // BTC 0.5
}
```

> Example: the end-user is asking how many BTC's they will receive in exchange for $16,000 USD:

```json
{
  "base_currency": "USD",
  "base_amount": 16000000000, // USD $16,000
  "quote_currency": "BTC"
}
```

Name           | Type        |   |
-------------- | ----------- | - |
base_currency  | Currency    | **required**
base_amount    | MoneyAmount | **required** if `quote_amount` is missing, or missing otherwise
quote_currency | Currency    | **required**
quote_amount   | MoneyAmount | **required** if `base_amount` is missing, or missing otherwise

### base_currency ###
#### (Currency, **required**)

The currency to convert from: this is the currency the end-user wishes to sell.

### base_amount ###
#### (MoneyAmount, **required** if `quote_amount` is missing, or missing otherwise)

The amount of `base_currency` units, in millionths of a unit, the end-user wishes to sell.

If this is present then `quote_amount` is missing, and the end-user is asking how many `quote_currency` units they will receive for selling `base_amount` units of `base_currency`.

If this is missing then `quote_amount` is present, and the end-user is asking how many `base_currency` units they need to sell in order to receive `quote_amount` units of `quote_currency`.

### quote_currency ###
#### (Currency, **required**)

The currency to convert to: this is the currency the end-user wishes to receive.

If `base_currency` represents a fiat currency then `quote_currency` will represent a crypto currency, and vise versa.

### quote_amount ###
#### (MoneyAmount, **required** if `base_amount` is missing, or missing otherwise)

The amount of `quote_currency` units, in millionths of a unit, the end-user wishes to receive.

If this is present then `base_amount` is missing, and the end-user is asking how many `quote_currency` units they need to sell in order to receive `quote_amount` units of `quote_currency`.

If this is missing then `base_amount` is present, and the end-user is asking many `quote_currency` units they will receive for selling `base_amount` units of `base_currency`.

## Response ##

> An example response:

```json
{
  "quote_id": "bb4fbdef-9abc-41c1-94d9-a670413c4d02",
  "rate": 8000
}
```

Name     | Type  |   |
-------- | ----- | - |
quote_id | Id    | **required**
rate     | Float | **required**

### quote_id ###
#### (Id, **required**)

An identifier for this quote. Simplex will use this identifier when referencing this particular quote in subsequent API's.

### rate ###
#### (Float, **required**)

The exchange rate: how many units of `quote_currency` equal one unit of `base_currency`.

The rate you provide may take the amount into consideration: Simplex will use this rate for this particular quote only, and will not assume that the rate holds for different amounts.

## p/REST ##

`get-quote-lq` is only supported as a p/REST endpoint. You must supply an endpoint for it, and Simplex will use  
<span class="http-verb http-get">GET</span> `https://${YOUR_API_URL}/get-quote-lq`

## MsgQueue ##

`get-quote-lq` is not supported in MsgQueue. You must supply a p/REST endpoint for it.

[modeline]: # ( vim: set ts=2 sw=2 expandtab wrap linebreak: )
