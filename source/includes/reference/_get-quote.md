# get-quote #

Convert between crypto and fiat money.

In order for you to provide the "Quote" experience described in the "Flow" section, where users make the decision of how much cryptocurrency they wish to sell, you need to be able to convert back and forth between crypto and fiat money. This is what the `get-quote` API is for.

## Synopsis ##

API name: **`get-quote`**  
Direction: **You &rarr; Simplex**

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

> Example response:

```json
{
    "quote_id": "4c52ecda-e40e-4f94-89da-adc4e2e78b45",
    "rate": 8000
}
```

Name     | Type  |   |
-------- | ----- | - |
quote_id | Id    | **required**
rate     | Float | **required**

### quote_id ###
#### (Id, **required**)

An identifier for this quote. Keep this identifier and pass it back to Simplex when creating a transaction based on this quote.

### rate ###
#### (Float, **required**)

The exchange rate: how many units of `quote_currency` equal one unit of `base_currency`.

## REST ##

<span class="http-verb http-get">GET</span> `https://api.simplexcc.com/v1/get-quote`

[modeline]: # ( vim: set ts=2 sw=2 expandtab wrap linebreak: )
