# txn-event-notify #

Notifications about major transaction life cycle events.

You receive notifications when certain events occur during the life cycle of transactions. You might use these notifications for analytics, for example, or for prompting end-users to perform certain actions.

## Synopsis ##

Message name: **`txn-event-notify`**  
Direction: **Simplex &rarr; You**

## Parameters ##

> Example notification:

```json
{
  "txn_id": "af492cb2-5b07-4318-8ece-be34f479e23b",
  "timestamp": 1537540352.012,
  "event": "txn-approved"
}
```

Name      | Type      |   |
--------- | --------- | - |
txn_id    | Id        | **required**
timestamp | Timestamp | **required**
event     | String    | **required**

### txn_id ###
#### (Id, **required**)

Identifier of the Simplex transaction.

### timestamp ###
#### (Timestamp, **required**)

Timestamp of when the event occurred.

### event ###
#### (String, **required**)

The type of event that occurred in the transaction.

One of { `"txn-approved"`, `"txn-declined"`, `"txn-refunded"` }.

`"txn-approved"` : The transaction was approved. The end-user's payment method has either been charged (in a BuyCrypto transaction) or credited (in a SellCrypto transaction).

`"txn-declined"` : The transaction was declined, for policy or risk reasons. Simplex does not divulge exact reasons to end-users. No fiat has been charged, and any holds on the end-user's card have been released (some users' banks may take time to reflect that).

`"txn-refunded"` : The transaction has been refunded: fiat money (in a BuyCrypto transaction) or cryptocurrency (in a SellCrypto transaction) has been returned to the end-user.

## Response ##

No response is expected.

## p/REST ##

If you supply a p/REST endpoint for this API, Simplex will use  
<span class="http-verb http-post">POST</span> `https://${YOUR_API_URL}/txn-event-notify`

## MsgQueue ##

Alternatively, You may receive this notification as a message of type `"txn-event-notify"` in  
<span class="http-verb http-get">GET</span> `https://api.simplexcc.com/v1/msg`

You need to acknowledge receipt of the message, by  
<span class="http-verb http-post">POST</span> `https://api.simplexcc.com/v1/msg/:msg-id/ack`

You do not need to respond.

[modeline]: # ( vim: set ts=2 sw=2 expandtab wrap linebreak: )
