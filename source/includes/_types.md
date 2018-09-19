# Types #

### integer ###

### float ###

### uuid ###

An opaque string (i.e.: do not assume anything about its contents). Currently used to hold UUID4's.

<aside class="warning">
No guarantees are made regarding the case (upper/lower) of the contents, or for that matter that the string actually contains a UUID4 or is of any certain length.<br/>
<br/>
<b>You have been warned.</b>
</aside>

### currency_symbol ###

3-letter upper-case string.

One of { "USD", "EUR", "BTC", "BCH", "LTC" }.

### money_amount ###

An integer. Used for holding amounts of money, be it crypto or fiat. The units used are millionths of a whole currency unit.

<aside class="notice">
This is <i>not</i> floating point parameter. Rather, this is an integer counting millionths of the whole.<br>
An amount of 100.0, for example, is represented as 100000000 (one hundred million); and a value of 30000 (thirty thousand) represents the amount 0.03.
</aside>
