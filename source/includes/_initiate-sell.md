# initiate-sell #

Create a SellCrypto transaction, and have the user start the checkout flow.

A SellCrypto transaction is initiated by the entity representating the end-user, such as a wallet app, an exchange, etc.

Each transaction has an identifier, which you use when referring to the transaction. This identifier is created by you, for your convenience, and passed to Simplex. It must be unique, so a good practice is to use a UUID4.

Other than `txn_id` and `ref_url` all parameters are optional:

 * When a parameter is required in order to complete the checkout flow, but is not supplied, Simplex will ask the end-user for it. For example: if `quote_id` is not supplied then Simplex will ask the end-user how much crypto currency they wish to sell, and will present an appropriate fiat quote.

 * Parameters in `account_details` are optional but allow Simplex's risk algorithms to approve a wider range of end-users. The more information you supply in `account_details` the more accurate Simplex's risk decisions will be, and as a result the happier your users become.

The response includes a "transaction URL", which you use to send the end-user to the Simplex-managed checkout flow.

## Synopsis ##

API name: **`initiate-sell`**  
Direction: **You &rarr; Simplex**  
Transports: **REST, JWT**

## Parameters ##

> Example request

```json
{
  "txn_details": {
    "txn_id": "af492cb2-5b07-4318-8ece-be34f479e23b",
    "quote_id": "4c52ecda-e40e-4f94-89da-adc4e2e78b45",
    "src_crypto_addrs": [ "1EmXYy57z71H8J5jrxXsdjuJXZnPZgHnjh" ],
    "ref_url": "https://www.legit-site.com/pay-with-btc",
  },

  "account_details": {
    "account_id": "acme:Tm9TcG9vbg",

    "web_sessions": [{
      "ip": "74.115.209.58",
      "timestamp": 1529055882.223,
      "user_agent": "Mozilla/5.0 (Acme Laptop) AcmeWebKit/128 (KHTML, like Gecko) Chrome/65.0.1024.100",
      "uaid": "VHJhY2tpbmdDb29raWU",
      "http_accept_language": "en-US,en;q=0.9",
    }, {
      "ip": "74.115.209.61",
      "timestamp": 1536831495.900,
      "user_agent": "Mozilla/5.0 (Acme Laptop) AcmeWebKit/128 (KHTML, like Gecko) Chrome/65.0.1024.100",
      "uaid": "VHJhY2tpbmdDb29raWU",
      "http_accept_language": "en-US,en;q=0.9",
    }],

    "personal_details": {
      "first_name": "Wile",
      "last_name": "Coyote",
      "emails": [ "wile.e@rr.com" ],
      "phones": [ "+16085559103" ],
      "addrs": [{
        "line1": "42 Desert Road",
        "line2": "Apt. 314",
        "city": "San Diego",
        "zip": "22434",
        "country": "US",
        "state": "CA",
      }]
    }

  }
}
```

Name                      | Type                   | Notes
------------------------- | ---------------------- | -----
                          |                        |
txn_details               |                        |
&emsp; txn_id             | Id                     | **required**
&emsp; ref_url            | String                 | **required**
&emsp; quote_id           | Id                     |
&emsp; src_crypto_addrs   | List\<CryptoAddr\>     |
&emsp; refund_crypto_addr | CryptoAddr             |
                          |                        |
account_details           |                        |
&emsp; account_id         | String                 |
&emsp; web_sessions       | List\<WebSessionInfo\> |
&emsp; personal_details   |                        |
&emsp; &emsp; first_name  | String                 |
&emsp; &emsp; last_name   | String                 |
&emsp; &emsp; emails      | List\<String\>         |
&emsp; &emsp; phones      | List\<String\>         |
&emsp; &emsp; addrs       | List\<Addr\>           |

Type `WebSessionInfo`

Name                 | Type      | Notes        | Description
-------------------- | --------- | ------------ | -----------
ip                   | String    | **required** | IPv4 of end-user's device
timestamp            | Timestamp | **required** | Timestamp of session start
user_agent           | String    |              | The `User-Agent` HTTP header from the end-user
uaid                 | String    |              | The value of a per-device tracking cookie that is managed by you; two equal`uaid`'s mean the same end-user device.
http_accept_language | String    |              | The `Accept-Language` HTTP header from the end-user

### txn_id ###
#### (Id, **required**)

### ref_url ###
#### (String, **required**)

### quote_id ###
#### (Id, optional)

### src_crypto_addrs ###
#### (List\<CryptoAddr\>, optional)

### refund_crypto_addr ###
#### (CryptoAddr, optional)

### account_id ###
#### (String, optional)

### web_sessions ###
#### (List\<WebSessionInfo\>, optional)

### first_name ###
#### (String, optional)

### last_name ###
#### (String, optional)

### emails ###
#### (List\<String\>, optional)

### phones ###
#### (List\<String\>, optional)

### addrs ###
#### (List\<Addr\>, optional)

## Response ##

> Example response when a transaction is successfully created:

```json
{
  "txn_url": "https://checkout.simplexcc.com/sell?t=af492cb2-5b07-4318-8ece-be34f479e23b"
}
```

> Example error scenario:

```json
{
  "error": "duplicate txn_id"
}
```

Name    | Type   | Notes
------- | ------ | ---------
txn_url | String |
error   | String |

### txn_url ###
#### (String)

The URL where the checkout flow will take place. You should direct the end-user's browser there, either in a new tab, an iframe, or a webview in your app.

In case of an error `txn_url` will not be returned.

### error ###
#### (String)

In case of an error creating the transaction, `error` will be set to a short string describing the error, and `txn_url` will will not be returned. The error string is short and technical, and is not meant for end-users.

If the transaction was created successfully then `error` will not be returned.

## Transports ##

### REST ###

<span class="http-verb http-post">POST</span>`https://api.simplexcc.com/v1/rest/:msg_name`

### JWT ###

<span class="http-verb http-get">GET</span>`https://api.simplexcc.com/v1/jwt/:msg_name`

[modeline]: # ( vim: set ts=2 sw=2 expandtab wrap linebreak: )
