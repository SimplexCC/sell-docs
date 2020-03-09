# initiate-sell #

Create a SellCrypto transaction, and have the end-user start the checkout flow.

A SellCrypto transaction is initiated by the entity representing the end-user, such as a wallet app, an exchange, etc.

Each transaction has an identifier, which you use when referring to the transaction. This identifier is created by Simplex and returned in the response.

Other than `referer_url` **all parameters are optional**.

When a parameter is required in order to complete the checkout flow, but is not supplied, Simplex will ask the end-user for it. For example: if `quote_id` is not supplied then Simplex will ask the end-user how much cryptocurrency they wish to sell, and will present an appropriate fiat quote.

Parameters in `account_details` are optional but allow Simplex's risk algorithms to approve a broader range of end-users. The more information you supply in `account_details` the more accurate Simplex's risk decisions will be, and as a result the happier your users become.

The response includes a transaction URL to which you send your end-user in order to start the checkout flow.

The payment method (simplex-account / credit-card) of the transaction decide by the payment_method sent on the quote
## Synopsis ##

API name: **`initiate-sell`**  
Direction: **You &rarr; Simplex**

## Parameters ##

> Example request:

```json
{
  "referer_url": "https://www.legit-site.com/pay-with-btc",
  "return_url": "https://www.legit-site.com/thank-you",
  "deep_link": "https://www.legit-site.com/sells/af492cb2-5b07-4318-8ece-be34f479e23b",

  "txn_details": {
    "quote_id": "4c52ecda-e40e-4f94-89da-adc4e2e78b45",
    "source_crypto_addresses": [ "1EmXYy57z71H8J5jrxXsdjuJXZnPZgHnjh" ],
    "refund_crypto_address": "1EmXYy57z71H8J5jrxXsdjuJXZnPZgHnjh"
  },

  "account_details": {
    "account_id": "39cb996a-6cc8-43b9-ad37-1102a958ff38",

    "web_sessions": [{
      "ip": "74.115.209.58",
      "timestamp": 1529055882.223,
      "user_agent": "Mozilla/5.0 (Acme Laptop) AcmeWebKit/128 (KHTML, like Gecko) Chrome/65.0.1024.100",
      "uaid": "VHJhY2tpbmdDb29raWU",
      "http_accept_language": "en-US,en;q=0.9"
    }, {
      "ip": "74.115.209.61",
      "timestamp": 1536831495.900,
      "user_agent": "Mozilla/5.0 (Acme Laptop) AcmeWebKit/128 (KHTML, like Gecko) Chrome/65.0.1024.100",
      "uaid": "VHJhY2tpbmdDb29raWU",
      "http_accept_language": "en-US,en;q=0.9"
    }],

    "personal_details": {
      "first_name": "Wile",
      "last_name": "Coyote",
      "emails": [ "wile.e@rr.com" ],
      "phones": [ "+16085559103" ],
      "addresses": [{
        "line1": "42 Desert Road",
        "line2": "Apt. 314",
        "city": "San Diego",
        "zip": "22434",
        "country": "US",
        "state": "CA"
      }]
    }

  }
}
```

Name                           | Type                   |   |
------------------------------ | ---------------------- | - |
                               |                        |
referer_url                    | String                 | **required**
return_url                     | String                 |
deep_link                      | String                 |
                               |                        |
txn_details                    |                        |
&emsp; quote_id                | Id                     |
&emsp; source_crypto_addresses | List\<CryptoAddress\>  |
&emsp; refund_crypto_address   | CryptoAddress          |
                               |                        |
account_details                |                        |
&emsp; account_id              | Id                     |
&emsp; web_sessions            | List\<WebSessionInfo\> |
&emsp; personal_details        |                        |
&emsp; &emsp; first_name       | String                 |
&emsp; &emsp; last_name        | String                 |
&emsp; &emsp; emails           | List\<String\>         |
&emsp; &emsp; phones           | List\<String\>         |
&emsp; &emsp; addresses        | List\<Address\>        |

Type `WebSessionInfo` :

Name                 | Type      |              | Description
-------------------- | --------- | ------------ | -----------
ip                   | String    | **required** | IPv4 of end-user's device
timestamp            | Timestamp | **required** | Timestamp of session start
user_agent           | String    |              | The `User-Agent` HTTP header sent by the end-user's browser
uaid                 | String    |              | The value of a per-device tracking cookie that is managed by you. That is to say: equal `uaid`'s mean "same end-user device".
http_accept_language | String    |              | The `Accept-Language` HTTP header sent by the end-user's browser

### referer_url ###
#### (String, **required**)

The value of the `Referer` HTTP header with which the end-user first landed at your site.

We're really asking: "where did the end-user arrive at your site from?" (or, in case you're feeling fancy: "whence did the end-user arrive at your site?")

### return_url ###
#### (String, optional)

A URL to redirect the end-user to when the transaction is finalized.

### deep_link ###
#### (String, optional)

A deep-link to the transaction page in the wallet
will be send via email once user could send his crypto.
If not provide, generic email will sent instead.

### txn_details.quote_id ###
#### (Id, optional)

The `quote_id` returned by `get-quote`.

If this is missing then Simplex will provide the "Quote" user experience as the first stage in the checkout flow.

### txn_details.source_crypto_addresses ###
#### (List\<CryptoAddress\>, optional)

The source crypto address(es) from which, when transaction is approved, the cryptocurrency will be sent on the blockchain.

Simplex uses these to run preliminary risk, policy and compliance checks.

### txn_details.refund_crypto_address ###
#### (CryptoAddress, optional)

The crypto address to which sent cryptocurrency will be returned in case of a refund.

If this is not provided, and only in case a refund is required, Simplex will invoke the `get-destination-crypto-address` API with `reason == "refund"`.

### account_details.account_id ###
#### (Id, optional)

The identifier you use for the end-user's account.

<aside class="notice">
Make sure to pass this parameter -- your users will thank you.
</aside>

Simplex uses `account_id` to identify returning users, and to afford them the smoothest possible experience. They won't need to fill-in nor verify their email or billing information, for example.

Instead of the actual account identifier you may send its hash, or anything else for which the following holds: _If I send the same `account_id` then it's the same account_.

### account_details.web_sessions ###
#### (List\<WebSessionInfo\>, optional)

A list of sessions/logins in the account, each with at least an IP and a timestamp.

If the account has more than 200 login events, include the first 100 and the last 100. In particular make sure to include the session in which the account was created.

Simplex uses these for policy and risk purposes, allowing your legitimate users to enjoy the credibility of their online identity.

### account_details.first_name ###
#### (String, optional)

The first name on the account.

### account_details.last_name ###
#### (String, optional)

The last name on the account.

### account_details.emails ###
#### (List\<String\>, optional)

A list of account email addresses, starting with the account's primary email address.

<aside class="notice">
Simplex will <strong>never</strong> send anything to any of these email addresses, and will never divulge them to a third party.
</aside>

Specify the primary email address first, followed by any other email addresses associated with the account, such as a secondary recovery email, past email addresses on the account, etc.

Simplex uses these for policy and risk purposes, allowing your legitimate users to enjoy the credibility of their online identity.

### account_details.phones ###
#### (List\<String\>, optional)

A list of account phone numbers, starting with the account's primary phone number.

<aside class="notice">
Simplex will <strong>never</strong> call any of these numbers, and will never divulge them to a third party.
</aside>

Specify the primary phone number first, followed by any other phone numbers associated with the account, such as a recovery phone number, past phone numbers on the account, etc.

Simplex uses these for policy and risk purposes, allowing your legitimate users to enjoy the credibility of their identity.

### account_details.addresses ###
#### (List\<Address\>, optional)

A list of account mailing addresses, starting with the account's primary address.

<aside class="notice">
Simplex will <strong>never</strong> mail anything to any of these mailing addresses, and will never divulge them to a third party.
</aside>

Specify the primary mailing address first, followed by any other mailing addresses associated with the account.

Simplex uses these for policy and risk purposes, allowing your legitimate users to enjoy the credibility of their identity.

## Response ##

> Example response:

```json
{
  "txn_id": "af492cb2-5b07-4318-8ece-be34f479e23b",
  "txn_url": "https://checkout.simplexcc.com/sell?t=af492cb2-5b07-4318-8ece-be34f479e23b"
}
```

Name    | Type   |   |
------- | ------ | - |
txn_id  | Id     | **required**
txn_url | String | **required**

### txn_id ###
#### (Id, **required**)

The identifier for the newly-created transaction. Simplex will use this identifier when referencing the transaction in subsequent API's.

### txn_url ###
#### (String, **required**)

The URL where the checkout flow will take place. You should direct the end-user's browser there, in either a new tab, an iframe, or a webview in your app.

In case of an error `txn_url` will not be returned.

## REST ##

<span class="http-verb http-post">POST</span> `https://api.simplexcc.com/v3/initiate-sell`

[modeline]: # ( vim: set ts=2 sw=2 expandtab wrap linebreak: )
