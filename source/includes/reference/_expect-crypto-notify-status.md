# expect-crypto-notify-status #

A notification, from you to Simplex, that the status of a transaction check process has changed.

## Synopsis ##

Message name: **`expect-crypto-notify-status`**  
Direction: **You &rarr; Simplex**

## Parameters ##

> Example: you notifying Simplex of a transaction check verification process status change:

```json
{
  "txn_check_id": "txnchk:09163938",
  "status": "reject",
  "reason": "AML checks failed on source crypto address"
}
```

Name         | Type   |   |
------------ | ------ | - |
txn_check_id | String | **required**
status       | String | **required**
reason       | String |

### txn_check_id ###
#### (String, **required**)

The identifier of the transaction check process previously created by you in response to `expect-crypto`.

### status ###
#### (String, **required**)

The status of the transaction check process.

One of { `"pending"`, `"success"`, `"reject"` }.

### reason ###
#### (String, optional)

If you reply with a `"reject"` status, this is a short description of the reason.

## Response ##

No response is generated.

## REST ##

<span class="http-verb http-post">POST</span> `https://api.simplexcc.com/v1/expect-crypto-notify-status`

[modeline]: # ( vim: set ts=2 sw=2 expandtab wrap linebreak: )
