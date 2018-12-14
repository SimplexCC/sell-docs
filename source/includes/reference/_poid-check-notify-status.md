# poid-check-notify-status #

A notification, from you to Simplex, that the status of a poid-check has changed.

## Synopsis ##

Message name: **`poid-check-notify-status`**  
Direction: **You &rarr; Simplex**

## Parameters ##

> Example: you notifying Simplex of a poid-check status change:

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

## Response ##

No response is generated.

## REST ##

<span class="http-verb http-post">POST</span> `https://api.simplexcc.com/v1/poid-check-notify-status`

[modeline]: # ( vim: set ts=2 sw=2 expandtab wrap linebreak: )
