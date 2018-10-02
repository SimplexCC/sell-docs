# SellCrypto Flow #

Here is a description of all the stages involved in a SellCrypto transaction. The description for each stage also notes when and how you may be a party to the transaction and how you can thus affect it.

## Deciding How Much To Sell ##

SellCrypto transactions are transactions in which your end-users sell their cryptocurrency and receive fiat money in exchange. The first thing end-users need to do, then, is to decide how much cryptocurrency they wish to sell.

In order to do that, end-users are presented with a screen where they can choose a cryptocurrency amount (e.g. 1.5 BTC) and see how much fiat money they will receive for it (e.g. 12,000 USD), or alternatively choose a fiat amount and see how much cryptocurrency they need to sell in order to receive that fiat amount.

This is called the "Quote" stage.

This user experience is typically provided by you, in your mobile/web app, using the `get-quote` API. If you do not provide this experience to end-users then Simplex will do this for you, as the very first stage of the checkout flow.

## Initiating the Transaction ##

Next, you create the transaction and direct your end-user to the checkout flow using the `initiate` API. You can also supply information -- such as the end-user's name, email address, KYC documents, etc. -- making the end-user's experience smoother by not requiring them to supply it.

This is called the "Initiate" stage.

Simplex returns a transaction URL to which you direct your end-user, and the checkout flow begins.

## Checkout ##

When the end-user is redirected to the transaction URL the checkout flow begins.

As mentioned, if the end-user arrives without having gone through the "Quote" stage first, they will first choose how much cryptocurrency to sell.

During the checkout flow the end-user is asked to fill in their email (or simply select it from a list if Simplex already knows them), their credit card details (or again simply select from a list), and their billing details. In some cases the end-user is also asked for KYC documents.

Simplex then runs its proprietary AI Risk Engine, and verifies that the transaction meets policy guidelines and AML ("Anti Money Laundering") rules. When all checks pass the transaction is approved.

## Money Changes Hands ##

After Simplex has approved the transaction it is time for crypto and fiat money to change hands. Simplex instructs you to send the cryptocurrency by creating a blockchain transaction.

Once Simplex detects that blockchain transaction it verifies that the amount is correct (or else the cryptocurrency is returned --- a refund) and then sends the fiat money to your end-user.

Both you and your end-user are notified at this point, and the transaction is complete.

[modeline]: # ( vim: set ts=2 sw=2 expandtab wrap linebreak: )
