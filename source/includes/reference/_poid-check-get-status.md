# poid-check-get-status #

A query from Simplex to you regarding the status of a poid-check previously created by you (e.g. in response to `poid`).

## Synopsis ##

Message name: **`poid-check-get-status`**  
Direction: **Simplex &rarr; You**

## Parameters ##

> Example: Simplex querying you for the status of a poid-check:

```json
{
  "poid_check_id": "poid:3209830"
}
```

Name          | Type |   |
------------- | ---- | - |
poid_check_id | Id   | **required**

### poid_check_id ###
#### (Id, **required**)

The identifier of a poid-check previously created by you (e.g. in response to `poid`).

## Response ##

> Example response:

```json
{
  "poid_check": {
    "id": "poid:3209830",
    "status": "completed",
    "result": "soft_fail",
    "reasons": ["first name not written exactly as in document"]
  }
}
```

Please refer to the documentation in `poid` for a description of the PoidCheck type.

Name       | Type      |   |
---------- | --------- | - |
poid_check | PoidCheck | **required**

## p/REST ##

If you supply a p/REST endpoint for this API, then in order to poll for the status of proof-of-identity checks Simplex will use  
<span class="http-verb http-get">GET</span> `https://${YOUR_API_URL}/poid-check-get-status`

## MsgQueue ##

Alternatively, you may receive messages of type `"poid-check-get-status"` in  
<span class="http-verb http-get">GET</span> `https://api.simplexcc.com/v3/msg`

You respond by  
<span class="http-verb http-post">POST</span> `https://api.simplexcc.com/v3/msg/:msg-id/response`

You will need to also acknowledge receipt of the message, by  
<span class="http-verb http-post">POST</span> `https://api.simplexcc.com/v3/msg/:msg-id/ack`

[modeline]: # ( vim: set ts=2 sw=2 expandtab wrap linebreak: )
