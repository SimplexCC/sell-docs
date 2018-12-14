# poid-get-status #

A query from Simplex to you regarding the status of a proof-of-identity verification process previously created by you in response to a `poid` API.

## Synopsis ##

Message name: **`poid-get-status`**  
Direction: **Simplex &rarr; You**

## Parameters ##

> Example: Simplex querying you for the status of a proof-of-identity verification process:

```json
{
  "poid_id": "poid:3209830"
}
```

Name    | Type |   |
------- | -----| - |
poid_id | Id   | **required**

### poid_id ###
#### (Id, **required**)

The identifier of the proof-of-identity verification process previously created by you in response to `poid`.

## Response ##

> Example: you responding to the Simplex query:

```json
{
  "status": "success"
}
```

Name    | Type           |   |
------- | -------------- | - |
status  | String         | **required**
reasons | List\<String\> | **required** if `status == "soft_fail"` or `status == "hard_fail"`

### status ###
#### (String, **required**)

The status of the proof-of-identity verification process.

One of { `"pending"`, `"success"`, `"soft_fail"`, `"hard_fail"` }.

### reasons ###
#### (List\<String\>, **required** if `status == "soft_fail"` or `status == "hard_fail"`)

A list of short, descriptive reasons for the status.

**Note**: the strings will be displayed to the end-user, and thus need to be in English, short, descriptive, and proper.

## p/REST ##

If you respond with a `"pending"` status to a `poid` API, and you supply a p/REST endpoint for this API, then in order to poll for the status of the verification process Simplex will use  
<span class="http-verb http-get">GET</span> `https://${YOUR_API_URL}/poid-get-status`

## MsgQueue ##

Alternatively, you may receive this request as a message of type `"poid-get-status"` in  
<span class="http-verb http-get">GET</span> `https://api.simplexcc.com/v1/msg`

You respond by  
<span class="http-verb http-post">POST</span> `https://api.simplexcc.com/v1/msg/:msg-id/response`

You will need to also acknowledge receipt of the message, by  
<span class="http-verb http-post">POST</span> `https://api.simplexcc.com/v1/msg/:msg-id/ack`

[modeline]: # ( vim: set ts=2 sw=2 expandtab wrap linebreak: )
