# get-quote #

Convert between crypto and fiat money.

In order for you to provide the "get quote" experience, where the user makes the decision of how much crypto currency to sell, you need to be able to convert back and forth between crypto and fiat money. This is what the "get-quote" API is for.

 | |
-|-|
Message Name | get-quote
Direction | You -> Simplex
Transports | REST, JWT

## Parameters ##

> Example request

```javascript--json
{
  "source_currency": "EUR",
  "source_amount": 100000000, // EUR 100.00
  "requested_currency": "BTC",
}
```

> Another example:

```javascript--json
{
  "source_currency": "BTC",
  "source_amount": 223630, // 0.22363 BTC
  "requested_currency": "EUR",
}
```

Name | Type | Required?
---- | ---- | ---------
source_currency | currency_symbol | required
source_amount | money_amount | required
requested_currency | currency_symbol | required

### source_currency (currency_symbol, mandatory) ###

The currency to convert from.

<aside class="notice">
SellCrypto currently supports only EUR as a fiat currency.
</aside>

### source_amount (money_amount, mandatory) ###

The amount of `source_currency` units, in millionths of a unit, to convert.

<aside class="notice">
Reminder: the parameter is integer, and represents millionths of the whole. (See the secion "Types")
</aside>

### requested_currency (currency_symbol, mandatory) ###

The currency to convert to.

<aside class="notice">
SellCrypto currently supports only EUR as a fiat currency.
</aside>

If `source_currency` represents a fiat currency then `requested_currency` must represent a crypto currency, and vise versa.

## Response ##

> An example response:

```javascript--json
{
    "rate": 8000.5,
    "quote_id": "4c52ecda-e40e-4f94-89da-adc4e2e78b45",
}
```

Name | Type
---- | ----
rate | float
quote_id | uuid

### rate (float) ###

The exchange rate: how much to multiply `source_amount` by in order to get the equivalent amount in `requested_currency`.

### quote_id (uuid) ###

An id generated for this quote; you should keep this id and pass it to Simplex when creating a transaction based on this quote.

Some notes on semantics, use cases, tips, ...

## Transports ##

### REST ###

GET `/get_quote`

### JWT ###
