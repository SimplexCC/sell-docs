# Introduction #

Welcome to the SellCrypto API documentation.

The SellCrypto API makes it possible for you to initiate SellCrypto transactions, thus enabling your users to monetize their crypto currencies and receive fiat money for them. The API further allows you to receive notifications when major events in the transaction lifecycle occur, enabling you to track per-transaction status.

The API documentation starts by describing the flow of a SellCrypto transaction, introducing the major concepts involved; an overview of the elements of the API then follows; detailed reference information for each API message is then provided; we conclude with the technical details required for communicating with the API servers.

## Flow ##

### qet_quote ###

### initiate ###

### we perform the flow ###

* quote if needed
* "login" screen
* billing info
* email verification if needed
* payment method selection
* credit card details
* checks: aml, pep, ...
* call liquidity/wallet send-coins
* monitor blockchain
* send fiat to user
* notify wallet
