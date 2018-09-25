# API Concepts #

## Transports ##

Simplex's API's are designed to be usable in environments with different capabilities. Such environments may or may not be:

 * Considered safe, and thus allowed to hold an API key
 * Able to run code for generating requests and processing responses
 * Able to expose REST endpoints for Simplex to invoke (to notify you when a transaction is approved, e.g.).

To that end it is possible to invoke the API's in several different ways. We call these ways **"Transports"**.

<aside class="notice">
Regardless of the transport used, the API's remain the same.
</aside>

Regardless of the transport used, the API's remain the same: they accept the same parameters, return the same responses, and the same errors may arise under the same circumstances.

What changes between transports is the _how:_ how authentication is performed, how parameters are passed, how responses are received, and how errors are signalled.

The different transports are:

Name     | Description
-------- | -----------
REST     | Plain old REST
p/REST   | "Partner REST": You expose REST endpoints for Simplex to invoke
JWT      | Single HTTP GET endpoint, parameters are a Base64-encoded JSON on the query string
MsgQueue | "Message Queue": You poll Simplex for messages

These are all documented in the section "Transports" (you guesses it!), while the documentation for each API simply states what transports are available for that API.

## Sandbox vs. Production ##

Simplex provides a sandbox environment, which you use while developing and testing your integration. When you are ready to go live, you simply switch to the production environment.

Environments are accessed with different URLs and require different API keys (see below).

## API key ##

As part of your onboarding with Simplex you receive two API keys, which you will use for authentication your API's. Note that the keys for the sandbox and production environments are different.

[modeline]: # ( vim: set ts=2 sw=2 expandtab wrap linebreak: )
