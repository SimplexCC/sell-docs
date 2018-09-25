# MsgQueue #

Base URL: `https://api.simplexcc.com/v1/q`

Auth: \_partner= and \_apikey= on URL ???

### Get messages ###

GET `/msg`

### ACK a message ###

POST `/msg/:id/ack`

### Respond to a previous message ###

POST `/msg/:id/response`

### Send a message ###

POST `/msg/:msg-name`

### Errors ###

TODO

You receive the request as a message of type `get-dst-crypto-addr` in

<span class="http-verb http-get">GET</span>`https://api.simplexcc.com/v1/q/msg`

You respond by

<span class="http-verb http-post">POST</span>`https://api.simplexcc.com/v1/q/msg/:msg-id/response`

Don't forget to also acknowledge the receipt of the message, by

<span class="http-verb http-post">POST</span>`https://api.simplexcc.com/v1/q/msg/:msg-id/ack`

[modeline]: # ( vim: set ts=2 sw=2 expandtab wrap linebreak: )
