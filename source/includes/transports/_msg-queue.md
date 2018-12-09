# MsgQueue #

An alternative to p/REST is MsgQueue, which has message queue semantics: you poll Simplex for messages waiting for you, take action on the message if required, respond to the message if required, and then acknowledge your handling of the message so you don't receive it again.

## Polling ##

You poll for messages by periodically issuing:  

<span class="http-verb http-get">GET</span> `https://api.simplexcc.com/v1/msg`

The response is JSON object with a single `"messages"` field containing a list of messages.

Each message has the following fields:

Name     | Type   |              | Description
-------- | ------ | -------------| -----------
msg_id   | Id     | **required** | A unique identifier for this message
msg_type | String | **required** | The message type (e.g. `"send-crypto"`)
msg      | Object | **required** | The message payload itself, as described in the relevant API section

### Responding ###

If a message requires a response, you respond with

<span class="http-verb http-post">POST</span> `https://api.simplexcc.com/v1/msg/:msg-id/response`

`:msg-id` is the message identifier returned from `/msg`, and the POST body contains the response.

## Acknowledging ##

To avoid loss of messages, an explicit acknowledgement from you is required to each message. Until you acknowledge a message you will keep receiving it from `/msg`.

To acknowledge that you have handled a particular message and are done with it:

<span class="http-verb http-post">POST</span> `https://api.simplexcc.com/v1/msg/:msg-id/ack`

`:msg-id` is the identifier of the message you are acknowledging. There are no other parameters, so no body is expected in the POST.

<aside class="warning">
Only acknowledge messages after you have completely finished handling them.
</aside>

[modeline]: # ( vim: set ts=2 sw=2 expandtab wrap linebreak: )
