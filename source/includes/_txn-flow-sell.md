# SellCrypto Flow #

A description of the flow of a SellCrypto transaction, from the end-user's point of view, follows. It is important that you read this section in order to understand the meaning and context of the various API messages.

## Quote ##

SellCrypto transactions are transactions in which your end-user sells their crypto currency in exchange for fiat money. The first thing to establish, then, is how much crypto currnecy the end-user wishes to sell (and consequentially how much fiat they will receive for it), or figure out how much crypto currency the end-user needs to sell in order to receive a certain amount of fiat money.

In a typical flow the user is presented with a screen where they may enter/select a crypto currency (e.g. BTC) and an amount (e.g. 2) and in response get a quote for how much fiat money they will receive for that crypto currency and amount (e.g. 7,500 EUR). The user might also enter a fiat amount (e.g. 1,500 EUR) and get a quote for how much crypto currency they need to sell in order to receive that fiat amount (e.g. 0.4 BTC).

This user experience is typically provided by you in your mobile app / webapp. If you don't provide that, Simplex will provide it for you as the very first step of the transaction flow.

## Initiate ##

## Checkout ##

* quote if needed
* "login" screen
* billing info
* email verification if needed
* payment method selection
* credit card details
* checks: aml, pep, ...

## Crypto and fiat change hands ##

* call liquidity/wallet send-crypto
* monitor blockchain
* send fiat to user

## Notification ##

* notify wallet
