# kyc-poid-req #

A request from Simplex to you, asking you to verify a KYC proof-of-identity document.

## Synopsis ##

API name: **`kyc-poid-req`**  
Direction: **Simplex &rarr; You**

## Parameters ##

> Example request:

```json
{
  // TODO
}
```

Name                      | Type                    |              | Description
------------------------- | ----------------------- | ------------ | -----------
                          |                         |              |
txn_id                    | Id                      | **required** |
                          |                         |              |
claimed_personal_details  |                         | **required** |
&emsp; first_name         | String                  | **required** |
&emsp; last_name          | String                  | **required** |
&emsp; gender             | String                  | **required** | One of { `"MALE"`, `"FEMALE"` }
&emsp; date_of_birth      | Date                    | **required** |
                          |                         |              |
claimed_address           | Address                 | **required** |
                          |                         |              |
claimed_document          |                         | **required** |
&emsp; type               | String                  | **required** | One of { `"ID_CARD"`, `"PASSPORT"`, `"DRIVERS_LICENSE"` }
&emsp; number             | String                  | **required** |
&emsp; expiration         | Date                    | **required** |
&emsp; issuing_country    | String                  | **required** | ISO 3166-1 ALPHA-2
                          |                         |              |
document_images           | List<DocumentPageImage> | **required** |

Type `DocumentPageImage` :

Name | Type   |              | Description
-----| ------ | ------------ | -----------
page | String | **required** | Which page of the document is this image. One of { `"FRONT"`, `"BACK"` }.
url  | String | **required** | URL for image data. May be a data URI.

### dst_currency ###
#### (Currency, **required**)

The currency to convert to: this is the currency the end-user wishes to receive.

If `src_currency` represents a fiat currency then `dst_currency` will represent a crypto currency, and vise versa.

## Response ##

> An example response:

```json
{
  // TODO
}
```

Name            | Type
--------------- | ----
kyc_poid_req_id | Id

      case 'soft_fail': poidStatus = POID_STATUS.CLARIFICATION;
      case 'hard_fail': poidStatus = POID_STATUS.DECLINED;
      case 'success':   poidStatus = POID_STATUS.APPROVED;

### quote_id ###
#### (Id)

An identifier for this quote. Simplex will use this identifier when referencing this particular quote in subsequent API's.

## p/REST ##

If you supply a p/REST endpoint for this API, Simplex will use  
<span class="http-verb http-get">GET</span> `https://${YOUR_API_URL}/kyc-poid-req`

## MsgQueue ##

Alternatively, you may receive this request as a message of type `"kyc-poid-req"` in  
<span class="http-verb http-get">GET</span> `https://api.simplexcc.com/v1/msg`

You respond by  
<span class="http-verb http-post">POST</span> `https://api.simplexcc.com/v1/msg/:msg-id/response`

You will need to also acknowledge receipt of the message, by  
<span class="http-verb http-post">POST</span> `https://api.simplexcc.com/v1/msg/:msg-id/ack`

[modeline]: # ( vim: set ts=2 sw=2 expandtab wrap linebreak: )
