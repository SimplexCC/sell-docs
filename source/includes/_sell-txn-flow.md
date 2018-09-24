# SellCrypto Flow #

Here is a description of all the stages involved in a SellCrypto transaction. The description for each stage also notes when and how you may be a party to the transaction and how you can thus affect it.

## Deciding How Much To Sell ##

SellCrypto transactions are transactions in which your end-users sell their crypto currencies and receive fiat money in exchange. The first thing your end-users need to do, then, is to decide how much crypto currency they wish to sell.

In order to do that, your end-users are presented with a screen where they can choose a cryptocurrency amount (e.g. 1.5 BTC) and see how much fiat money they will receive for it (e.g. 12,000 USD), or alternatively choose a fiat amount and see how much crypto currency they need to sell in order to receive that fiat amount.

This is called the "Quote" stage.

This user experience is typically provided by you, in your mobile/web app, using the `get-quote` API. If you don not provide this experience for the end-users then Simplex will do this for you, as the very first stage of the checkout flow.

## Initiating the Transaction ##

You then create the transaction and start the checkout flow, using the `initiate` API. With this API you can also submit information you have about the end-user, so that Simplex doesn't need to ask for it and the end-user's experience is effortless. Information you can submit includes name, emails, phones, addresses, and KYC documents.

This is called the "Initiate" stage.

Simplex then creates the transaction and returns a transaction URL. You then send your end-user (in your app / an iframe / a browser tab) to the transaction URL, where the checkout flow occurs.

## Checkout ##

* quote if needed
* "login" screen / email verification
* payment method selection / payment method details / billing info details
* checks: aml, pep, ...
* refund

## Money Changes Hands ##

After Simplex has approved the transaction it is time for crypto and fiat money to change hands. Simplex instructs you to send the cryptocurrencies, and once that happens sends the fiat money to your end-user.

Both your end-user and you are notified at this point, and the transaction is finalized.

[modeline]: # ( vim: set ts=2 sw=2 expandtab wrap linebreak: )
