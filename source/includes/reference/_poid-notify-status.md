# poid-notify-status #

A notification, from you to Simplex, that the status of a proof-of-identity verification process has changed.

## Synopsis ##

Message name: **`poid-notify-status`**  
Direction: **You &rarr; Simplex**

## Parameters ##

> You notifying Simplex of a proof-of-identity verification process status change:

```json
{
  "poid_id": "poid:3209830",
  "status": "success"
}
```

Name    | Type   |   |
------- | ------ | - |
poid_id | String | **required**
status  | String | **required**

### poid_id ###
#### (String, **required**)

The identifier of the proof-of-identity verification process previously created by you in response to `poid`.

### status ###
#### (String, **required**)

The status of the proof-of-identity verification process.

One of { `"success"`, `"soft_fail"`, `"hard_fail"` }.

## Response ##

No response is generated.

## REST ##

<span class="http-verb http-post">POST</span> `https://api.simplexcc.com/v1/poid-notify-status`

[modeline]: # ( vim: set ts=2 sw=2 expandtab wrap linebreak: )
