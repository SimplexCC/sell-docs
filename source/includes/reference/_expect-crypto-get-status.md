# expect-crypto-get-status #

A query from Simplex to you regarding the status of a proof-of-identity verification process previously created by you in response to a `expect-crypto` API.

## Synopsis ##

Message name: **`expect-crypto-get-status`**  
Direction: **Simplex &rarr; You**

## Parameters ##

> Example: Simplex querying you for the status of a transaction check:

```json
{
  "txn_check_id": "txnchk:09163938"
}
```

Name         | Type |   |
------------ | ---- | - |
txn_check_id | Id   | **required**

### txn_check_id ###
#### (Id, **required**)

The identifier of a transaction check process previously created by you in response to `expect-crypto`.

## Response ##

> Example: you responding to the Simplex query:

```json
{
  "status": "success"
}
```

Name   | Type   |   |
------ | ------ | - |
status | String | **required**
reason | String |

### status ###
#### (String, **required**)

The status of the transaction check process.

One of { `"pending"`, `"success"`, `"reject"` }.

### reason ###
#### (String, optional)

If you reply with a `"reject"` status, this is a short description of the reason.

## p/REST ##

If you respond with a `"pending"` status to a `expect-crypto` API, and you supply a p/REST endpoint for this API, then in order to poll for the status of the transaction check process Simplex will use  
<span class="http-verb http-get">GET</span> `https://${YOUR_API_URL}/expect-crypto-get-status`

## MsgQueue ##

Alternatively, you may receive this request as a message of type `"expect-crypto-get-status"` in  
<span class="http-verb http-get">GET</span> `https://api.simplexcc.com/v1/msg`

You respond by  
<span class="http-verb http-post">POST</span> `https://api.simplexcc.com/v1/msg/:msg-id/response`

You will need to also acknowledge receipt of the message, by  
<span class="http-verb http-post">POST</span> `https://api.simplexcc.com/v1/msg/:msg-id/ack`

[modeline]: # ( vim: set ts=2 sw=2 expandtab wrap linebreak: )
