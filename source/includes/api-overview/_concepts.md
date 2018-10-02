# Concepts #

## p/REST and MsgQueue ##

Certain use-cases require that Simplex "reach out" to you in order to notify you of events that have occurred, request that you perform certain actions, or get some information.

This is achieved by either you exposing API endpoints for Simplex to invoke or by you periodically polling Simplex, asking for any new "messages". Exposing API's for Simplex to invoke is called "p/REST" ("Partner REST"), while polling Simplex for messages is called "MsgQueue".

The specifics on p/REST and MsgQueue are documented in a dedicated section.

API's where Simplex reaches out to you are marked as such, and you can choose for each what method to use.

<aside class="notice">
Regardless of the method chosen, the API's remain the same: they accept the same parameters, return the same responses, and the same errors may arise under the same circumstances.
</aside>

## Sandbox vs. Production ##

Simplex provides a sandbox environment, which you use while developing and testing your integration. When you are ready to go live, you simply switch to the production environment.

Environments are accessed with different URLs and require different API keys.

## API key ##

As part of your onboarding with Simplex you receive two API keys, which you will use for authentication your API's. Note that the keys for the sandbox and production environments are different.

[modeline]: # ( vim: set ts=2 sw=2 expandtab wrap linebreak: )
