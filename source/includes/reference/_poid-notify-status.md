# poid-notify-status #

A notification, from you to Simplex, that the status of a proof-of-identity verification has changed.

## Synopsis ##

Message name: **`poid-notify-status`**  
Direction: **You &rarr; Simplex**

## Parameters ##

> Example: you notifying Simplex of a proof-of-identity verification status change:

```json
{
  "poid_id": "poid:3209830",
  "status": "soft_fail",
  "reasons": [ "Not all 4 corners of your ID card are visible" ]
}
```

Name    | Type           |   |
------- | -------------- | - |
poid_id | Id             | **required**
status  | String         | **required**
reasons | List\<String\> | **required** if `status == "soft_fail"` or `status == "hard_fail"`

### poid_id ###
#### (Id, **required**)

The identifier of the proof-of-identity verification process previously created by you in response to `poid`.

### status ###
#### (String, **required**)

The status of the proof-of-identity verification process.

One of { `"success"`, `"soft_fail"`, `"hard_fail"` }.

### reasons ###
#### (List\<String\>, **required** if `status == "soft_fail"` or `status == "hard_fail"`)

A list of short, descriptive reasons for the status.

**Note**: the strings will be displayed to the end-user, and thus need to be in English, short, descriptive, and proper.

## Response ##

No response is generated.

## REST ##

<span class="http-verb http-post">POST</span> `https://api.simplexcc.com/v1/poid-notify-status`

[modeline]: # ( vim: set ts=2 sw=2 expandtab wrap linebreak: )
