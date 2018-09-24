# Types #

### Integer ###

### Float ###

### Timestamp ###

A float, Unix timestamp, millisecond resultion.

### Id ###

An opaque string (i.e.: do not assume anything about its contents).

<aside class="warning">
No guarantees are made regarding the internal format, and it may change in the future. <strong>You have been warned.</strong>
</aside>

### FiatCurrency ###

3-letter upper-case string.

One of { "USD", "EUR" }.

### CryptoCurrency ###

3-letter upper-case string.

One of { "BTC", "BCH", "LTC" }.

### Currency ###

May be either a `FiatCurrency` or a `CryptoCurrency`.

### MoneyAmount ###

An integer. Used for holding amounts of money, be it crypto or fiat. The units used are millionths of a whole currency unit.

<aside class="notice">
This is <em>not</em> floating point parameter. Rather, this is an integer counting millionths of the whole. An amount of 100.0, for example, is represented as 100000000 (one hundred million), while a value of 30000 (thirty thousand) represents the amount 0.03.
</aside>

### CryptoAddr ###

A string, denoting a crypto address.

### Addr ###

An address in the real world

```
{
  "line1":   String, // [REQUIRED]
  "line2":   String, // [OPTIONAL]
  "city":    String, // [REQUIRED]
  "zip":     String, // [OPTIONAL]
  "country": String, // [REQUIRED] ISO 3166-1 ALPHA-2
  "state":   String, // [OPTIONAL] minimum 2 chars
}
```

[modeline]: # ( vim: set ts=2 sw=2 expandtab wrap linebreak: )
