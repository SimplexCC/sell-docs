# send-crypto #

An instruction, from Simplex, that you are to send crypto currency to a specified destination crypto address.

If you are the entity providing liquidity for a Simplex transaction, then after Simplex approves that transaction you will be instructed to make blockchain transaction; one that results in the transfer of a specified amount of crypto currency to a specified destination crypto address.

In case of a refund, if you are the entity that received the crypto currency you will be instructed to send it "back" (albeit to a possibly different crypto address from which it was sent).

## Synopsis ##

Message name: **`send-crypto`**  
Direction: **Simplex &rarr; You**  
Transports: **Message Queue Polling**

## Parameters ##

> Example

```javascript--json
{
  "txn_uuid": "af492cb2-5b07-4318-8ece-be34f479e23b",
  "dst_crypto_addr": "1GzW2M6L54DGMUUv2DTrdPTt8PX6ck5SYp",
  "currency": "BTC",
  "amount": 125000, // 0.125 BTC
}
```

Name | Type |
---- | ---- |
txn_uuid | uuid
dst_crypto_addr | crypto_addr
currency | crypto_currency
amount | money_amount

### txn_uuid ###
#### (uuid)

UUID of the Simplex transaction involved.

If you the entity that initiated the Simplex transaction then this `txn_uuid` is known to you, and you can use it for your internal tracking purposes.

Otherwise, if you did not initiate the Simplex transaction but are rather acting the liquidity provider/receiver, you can use this `txn_uuid` to correlate `send-crypto` messages with their corresponding `txn-event-notify` messages, as well as for auditing purposes.

### dst_crypto_addr ###
#### (crypto_addr)

The destination crypto address to which to send the crypto currency.

### currency ###
#### (crypto_currency)

The crypto currency to send.

### amount ###
#### (currency_amount)

The amount of `currency` to send.

## Response ##

> An example response:

```javascript--json
{
    "c": 3,
    "d": 4,
}
```

Name | Type
---- | ----
ret_c | tyep3
ret_d | type4

### ret_c ###
#### (type3)

Explanation.

### ret_d ###
#### (type4)

Explanation.

## Transports ##

### REST ###

<span class="http-verb http-get">GET</span>`https://api.simplexcc.com/v1/rest/:msg_name`

<span class="http-verb http-post">POST</span>`https://api.simplexcc.com/v1/rest/:msg_name`

### JWT ###

<span class="http-verb http-get">GET</span> `https://api.simplexcc.com/v1/jwt/:msg_name`
