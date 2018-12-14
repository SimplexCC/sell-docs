# check-crypto-get-status #

A query from Simplex to you regarding the status of a transaction check process previously created by you in response to a `check-crypto` API.

## Synopsis ##

Message name: **`check-crypto-get-status`**  
Direction: **Simplex &rarr; You**

## Parameters ##

> Example: Simplex querying you for the status of a transaction check:

```json
{
  "crypto_check_id": "da8f72d2-d1c6-4468-89da-37f6d87f0cdf"
}
```

Name            | Type |   |
--------------- | ---- | - |
crypto_check_id | Id   | **required**

### crypto_check_id ###
#### (Id, **required**)

The identifier of a crypto-check process previously created by you in response to `check-crypto`.

## Response ##

> Example: you responding to the Simplex query:

```json
{
  "status": "accept"
}
```

Name   | Type   |   |
------ | ------ | - |
status | String | **required**
reason | String |

### status ###
#### (String, **required**)

The status of the transaction check process.

One of { `"pending"`, `"accept"`, `"reject"` }.

### reason ###
#### (String, optional)

If you reply with a `"reject"` status, this is a short description of the reason.

## p/REST ##

If you respond with a `"pending"` status to a `check-crypto` API, and you supply a p/REST endpoint for this API, then in order to poll for the status of the transaction check process Simplex will use  
<span class="http-verb http-get">GET</span> `https://${YOUR_API_URL}/check-crypto-get-status`

## MsgQueue ##

Alternatively, you may receive this request as a message of type `"check-crypto-get-status"` in  
<span class="http-verb http-get">GET</span> `https://api.simplexcc.com/v1/msg`

You respond by  
<span class="http-verb http-post">POST</span> `https://api.simplexcc.com/v1/msg/:msg-id/response`

You will need to also acknowledge receipt of the message, by  
<span class="http-verb http-post">POST</span> `https://api.simplexcc.com/v1/msg/:msg-id/ack`

[modeline]: # ( vim: set ts=2 sw=2 expandtab wrap linebreak: )
