# check-crypto-notify-status #

A notification, from you to Simplex, that the status of a transaction check process has changed.

## Synopsis ##

Message name: **`check-crypto-notify-status`**  
Direction: **You &rarr; Simplex**

## Parameters ##

> Example: you notifying Simplex of a transaction check verification process status change:

```json
{
  "crypto_check_id": "da8f72d2-d1c6-4468-89da-37f6d87f0cdf",
  "status": "reject",
  "reason": "AML checks failed on source crypto address"
}
```

Name            | Type   |   |
--------------- | ------ | - |
crypto_check_id | Id     | **required**
status          | String | **required**
reason          | String |

### crypto_check_id ###
#### (Id, **required**)

The identifier of the crypto-check process previously created by you in response to `check-crypto`.

### status ###
#### (String, **required**)

The status of the transaction check process.

One of { `"pending"`, `"accept"`, `"reject"` }.

### reason ###
#### (String, optional)

If you reply with a `"reject"` status, this is a short description of the reason.

## Response ##

No response is generated.

## REST ##

<span class="http-verb http-post">POST</span> `https://api.simplexcc.com/v1/check-crypto-notify-status`

[modeline]: # ( vim: set ts=2 sw=2 expandtab wrap linebreak: )
