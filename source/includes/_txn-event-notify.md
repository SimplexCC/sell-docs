# txn-event-notify #

Notifications about major transaction life cycle events.

You receive notifications when certain events occur during the life cycle of transactions. You can use these notifications, for example, for analytics; or if you would like the end-user to perform a certain action you may choose to prompt them.

## Synopsis ##

Message name: **`txn-event-notify`**  
Direction: **Simplex &rarr; You**  
Transports: **MsgQueue**

## Parameters ##

> Example:

```json
{
  "txn_id": "af492cb2-5b07-4318-8ece-be34f479e23b",
  "timestamp": 1537540352.012,
  "event": "approved",
}
```

Name      | Type      |   |
--------- | --------- | - |
txn_id    | Id        |
timestamp | Timestamp |
event     | String    |

### txn_id ###
#### (Id)

Identifier of the Simplex transaction.

### timestamp ###
#### (Timestamp)

Timestamp of when the event occurred.

### event ###
#### (String)

The type of event that occurred in the transaction.

One of { `"txn-approved"`, `"txn-declined"`, `"txn-refunded"` }.

`"txn-approved"` : The transaction was approved. The end-user's payment method has either been charged (BuyCrypto) or been credited (SellCrypto; it may take up to 3 days to show on their statement).

`"txn-declined"` : The transaction was declined, for policy or risk reasons. Simplex does not divulge exact reasons to end-users. No fiat has been charged, and any holds on the end-user's card have been released (some users' banks may take time to reflect that).

`"txn-refunded"` : The transaction has been refunded. In a BuyCrypto transaction this means the fiat money was returned to the end-user, while in a SellCrypto transaction this means the cryptocurrency has been returned.

## Response ##

No response is expected.

## Transports ##

### MsgQueue ###

You receive this notification as a message of type `"txn-event-notify"` in  
<span class="http-verb http-get">GET</span>`https://api.simplexcc.com/v1/q/msg`

You need to acknowledge receipt of the message, by  
<span class="http-verb http-post">POST</span>`https://api.simplexcc.com/v1/q/msg/:msg-id/ack`

You do not need to respond.

[modeline]: # ( vim: set ts=2 sw=2 expandtab wrap linebreak: )
