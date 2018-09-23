# get-quote #

Convert between crypto and fiat money.

In order for you to provide the "Quote" experience described in the "Flow" section, where the user makes the decision of how much crypto currency to sell, you need to be able to convert back and forth between crypto and fiat money. This is what the "get-quote" API is for.

## Synopsis ##

Message name: **`get-quote`**  
Direction: **You &rarr; Simplex**  
Transports: **REST, JWT**

## Parameters ##

> Example request

```json
{
  "source_currency": "EUR",
  "source_amount": 100000000, // EUR 100.00
  "requested_currency": "BTC",
}
```

Name | Type | Required?
---- | ---- | ---------
source_currency | currency | __required__
source_amount | money_amount | required
requested_currency | currency | required

### source_currency ###
#### (currency, **required**)

The currency to convert from.

<aside class="notice">
SellCrypto currently supports only EUR as a fiat currency.
</aside>

### source_amount ###
#### (money_amount, **required**)

The amount of `source_currency` units, in millionths of a unit, to convert.

### requested_currency ###
#### (currency, **required**)

The currency to convert to.

<aside class="notice">
SellCrypto currently supports only EUR as a fiat currency.
</aside>

If `source_currency` represents a fiat currency then `requested_currency` must represent a crypto currency, and vise versa.

## Response ##

> An example response:

```json
{
    "rate": 8000.5,
    "quote_id": "4c52ecda-e40e-4f94-89da-adc4e2e78b45",
}
```

Name | Type
---- | ----
rate | float
quote_id | id

### rate ###
#### (float)

The exchange rate: how much to multiply `source_amount` by in order to get the equivalent amount in `requested_currency`.

### quote_id ###
#### (id)

An identifier generated for this quote. Keep this identifier and pass it back to Simplex when creating a transaction based on it.

## Transports ##

### REST ###

<span class="http-verb http-get">GET</span>`https://api.simplexcc.com/v1/rest/get_quote`

### JWT ###

<span class="http-verb http-get">GET</span>`https://api.simplexcc.com/v1/jwt/get_quote`

[modeline]: # ( vim: set ts=2 sw=2 expandtab wrap linebreak: )
