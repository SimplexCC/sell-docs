# Types #

### integer ###

### float ###

### timestamp ###

Float, Unix timestamp, millisecond resultion.

### id ###

An opaque string (i.e.: do not assume anything about its contents).

<aside class="warning">
No guarantees are made regarding the internal format, and it may change in the future. <strong>You have been warned.</strong>
</aside>

### fiat_currency ###

3-letter upper-case string.

One of { "USD", "EUR" }.

### crypto_currency ###

3-letter upper-case string.

One of { "BTC", "BCH", "LTC" }.

### currency ###

May be either a `fiat_currency` or a `crypto_currency`.

### money_amount ###

An integer. Used for holding amounts of money, be it crypto or fiat. The units used are millionths of a whole currency unit.

<aside class="notice">
This is <em>not</em> floating point parameter. Rather, this is an integer counting millionths of the whole. An amount of 100.0, for example, is represented as 100000000 (one hundred million), while a value of 30000 (thirty thousand) represents the amount 0.03.
</aside>

### crypto_addr ###

A string, denoting a crypto address.

### addr ###

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

### WebSessionInfo ###

```
WebSessionInfo: {
  "ip":                   String,    // [REQUIRED] IPv4 or IPv6 format
  "timestamp":            Timestamp, // [REQUIRED]
  "user_agent":           String,    // [OPTIONAL]
  "uaid":                 String,    // [OPTIONAL]
  "http_accept_language": String,    // [OPTIONAL]
}
```

[modeline]: # ( vim: set ts=2 sw=2 expandtab wrap linebreak: )
