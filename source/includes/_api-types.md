# API Types #

We bring here a description of the common types used throught the API.

### Integer ###

A plain old integer: a whole number (no fraction), positive, zero or negative.

### Float ###

A plain old floating-point number. A `number` in JSON parlance.

### Timestamp ###

A floating-point number representing the number of seconds since the Epoch (Jan 1, 1970 at 0:00am). Millisecond resolution.

E.g. `1537078623.305` represents Sep 16, 2018 at 06:17:03.305 UTC.

### Id ###

An opaque string.

When you receive `Id`'s from Simplex you may only store them and then send them back in subsequent API's.

<aside class="warning">
"Opaque" as is: assume nothing about the contents; it may change in the future.
</aside>

### FiatCurrency ###

A 3-letter upper-case string.

One of { `"USD"`, `"EUR"` }.

### CryptoCurrency ###

A 3-letter upper-case string.

One of { `"BTC"`, `"BCH"`, `"LTC"` }.

### Currency ###

Either a `FiatCurrency` or a `CryptoCurrency`.

### MoneyAmount ###

An integer representing amounts of money of a certain currency, be it crypto or fiat.

The integer counts _millionths of a whole currency unit_.

<aside class="notice">
An amount of 100.0 (a hundred "somethings") is represented as the integer 100,000,000 (one hundred million), while the integer 30,000 (thirty thousand) represents the amount 0.03 of "something".
</aside>

### CryptoAddr ###

A string representing a crypto address.

### Addr ###

An address in the real world:

Name    | Type   | Notes                     | Description
------- | ------ | ------------------------- | -----------
line1   | String | **required**              |
line2   | String |                           |
city    | String | **required**              |
zip     | String |                           |
country | String | **required**              | ISO 3166-1 ALPHA-2
state   | String | (min. 2 chars if present) |

[modeline]: # ( vim: set ts=2 sw=2 expandtab wrap linebreak: )
