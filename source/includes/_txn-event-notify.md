# txn-event-notify #

Notifications about major transaction lifecycle events.

You receive notifications when certain events occur during the lifecycle of transactions. You can use these notifications, for example, for your internal analytics; or if you would like the end-user to perform a certain action you may choose to prompt them.

## Synopsis ##

Message name: **`txn-event-notify`**  
Direction: **Simplex &rarr; You**  
Transports: **Message Queue**

## Parameters ##

> Example:

```javascript--json
{
  "txn_id": "af492cb2-5b07-4318-8ece-be34f479e23b",
  "timestamp": 1537540352.012,
  "event": "approved",
}
```

Name | Type |
---- | ---- |
txn_id | id |
ts | timestamp |
event | string |

### txn_id ###
#### (id)

Identifier of the Simplex transaction.

### ts ###
#### (timestamp)

Timestamp of when the event occured.

### event ###
#### (string)

The type of event that occured in the transaction.

One of { `"txn-approved"`, `"txn-declined"`, `"txn-refunded"` }.

 * `"txn-approved"`: The transaction was approved. The end-user's payment method has either been charged (BuyCrypto) or been credited (SellCrypto; though it may take up to 3 days to show on their statement).

 * `"txn-declined"`: The transaction was declined, for policy or risk reasons. Simplex does not divulge exact reasons to end-users. No fiat has been charged, and any holds on the end-user's card have been released (though some of the users' banks may take time to show that).

 * `"txn-refunded"`: The transaction has been refunded. In a BuyCrypto transaction this means the fiat was returned to the end-user, while in a SellCrypto transaction this means the crypto currencies have been returned.

## Response ##

No response is required.

## Transports ##

### Message Queue ###

[modeline]: # ( vim: set ts=2 sw=2 expandtab wrap linebreak: )
