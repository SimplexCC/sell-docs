# get-quote #

Convert between crypto and fiat money.

In order for you to provide the "Quote" experience described in the "Flow" section, where users make the decision of how much cryptocurrency they wish to sell, you need to be able to convert back and forth between crypto and fiat money. This is what the `get-quote` API is for.

## Synopsis ##

API name: **`get-quote`**  
Direction: **You &rarr; Simplex**

## Parameters ##

> Example request

```json
{
  "base_currency": "EUR",
  "base_amount": 100000000, // EUR 100.00
  "_currency": "BTC"
}
```

Name           | Type        |   |
-------------- | ----------- | - |
base_currency  | Currency    | **required**
base_amount    | MoneyAmount | **required**
quote_currency | Currency    | **required**

### base_currency ###
#### (Currency, **required**)

The currency to convert from.

<aside class="notice">
SellCrypto currently supports only EUR as a fiat currency.
</aside>

### base_amount ###
#### (MoneyAmount, **required**)

The amount of `base_currency` units, in millionths of a unit, to convert.

### quote_currency ###
#### (Currency, **required**)

The currency to convert to.

<aside class="notice">
SellCrypto currently supports only EUR as a fiat currency.
</aside>

If `base_currency` represents a fiat currency then `quote_currency` must represent a crypto currency, and vise versa.

## Response ##

> An example response:

```json
{
    "quote_id": "4c52ecda-e40e-4f94-89da-adc4e2e78b45",
    "rate": 0.000125
}
```

Name     | Type
-------- | ----
quote_id | Id
rate     | Float

### quote_id ###
#### (Id)

An identifier generated for this quote. Keep this identifier and pass it back to Simplex when creating a transaction based on it.

### rate ###
#### (Float)

The exchange rate: how much to multiply `base_amount` by in order to get the equivalent amount in `quote_currency`.

## REST ##

<span class="http-verb http-get">GET</span> `https://api.simplexcc.com/v1/get-quote`

[modeline]: # ( vim: set ts=2 sw=2 expandtab wrap linebreak: )
