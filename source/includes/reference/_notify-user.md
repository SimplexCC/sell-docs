# notify-user #

A request, from you to Simplex, that Simplex reach out to the end-user performing the transaction and let them know of something.

Simplex may communicate with the user one or more of the following means:

 * An email address Simplex has for the end-user
 * Texting the end-user's phone
 * Displaying a message to the end-user, in case they are currently on the Simplex checkout page

## Synopsis ##

Message name: **`notify-user`**  
Direction: **You &rarr; Simplex**

## Parameters ##

> Example: you requesting that Simplex reach out to an end-user:

```json
{
  "txn_id": "",
  "template_name": "execution-order-deeplink",
  "template_params": {
    "deeplink": "https://acme.com/app/execution_order?execution_order_id=7791528",
  },
}
```

Name            | Type                  |   |
--------------- | --------------------- | - |
txn_id          | Id                    | **required**
template_name   | String                | **required**
template_params | map\<String, String\> | **required**

### txn_id ###
#### (Id, **required**)

The identifier of the Simplex transaction involved.

### template_name ###
#### (String, **required**)

The name of the template containing the messaging to the user. The available names, and the meaning of their params, are preconfigured for you by your account manager.

### template_params ###
#### (map\<String, String\>, **required**)

Parameters to fill into the communications template. The meaning of each of those parameters is template-dependent.

## Response ##

No response is generated.

## REST ##

<span class="http-verb http-post">POST</span> `https://api.simplexcc.com/v1/notify-user`

[modeline]: # ( vim: set ts=2 sw=2 expandtab wrap linebreak: )
