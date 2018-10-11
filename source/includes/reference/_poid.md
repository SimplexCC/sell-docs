# poid #

A request from Simplex to you, asking that you verify a KYC proof-of-identity document.

The request includes data entered by an end-user, and scanned images of a document in support of the data. Simplex is asking that you verify that the images and legitimate and that the data in them matches that entered by the end-user.

This request from Simplex results in you starting "KYC POID verification process", for which you also generate an identifier. Your response includes this identifier, together with the status of the verification process:

`"completed"` : you completed the verification process, and the outcome is included in the response.

`"pending"` : the verification process is underway, and the outcome is pending.

`"failed"` : there was an error starting the verification process.

In all cases, your response must include a verification process identifier which Simplex can use to query you about its status and outcome.

## Synopsis ##

API name: **`poid`**  
Direction: **Simplex &rarr; You**

## Parameters ##

> Example request:

```json
{
  // TODO
}
```

Name                      | Type                      |              | Description
------------------------- | ------------------------- | ------------ | -----------
                          |                           |              |
txn_id                    | Id                        | **required** |
                          |                           |              |
claimed_personal_details  |                           | **required** |
&emsp; first_name         | String                    | **required** |
&emsp; last_name          | String                    | **required** |
&emsp; gender             | String                    | **required** | One of { `"male"`, `"female"` }
&emsp; date_of_birth      | Date                      | **required** |
                          |                           |              |
claimed_address           | Address                   | **required** |
                          |                           |              |
claimed_document          |                           | **required** |
&emsp; type               | String                    | **required** | One of { `"id_card"`, `"passport"`, `"drivers_license"` }
&emsp; number             | String                    | **required** |
&emsp; expiration         | Date                      | **required** |
&emsp; issuing_country    | String                    | **required** | ISO 3166-1 ALPHA-2
                          |                           |              |
document_images           | List\<DocumentPageImage\> | **required** |

Type `DocumentPageImage` :

Name | Type   |              | Description
-----| ------ | ------------ | -----------
page | String | **required** | Which page of the document is this image. One of { `"front"`, `"back"` }.
url  | String | **required** | URL for image data. May be a data URI.

### txn_id ###
#### (Id, **required**)

The identifier of the Simplex transaction involved.

### claimed_personal_details.first_name ###
#### (String, **required**)

Entered by the end-user, this is supposedly the first name appearing on the document.

This is a _claim_, not fact, until you have verified that indeed this field matches the images supplied.

### claimed_personal_details.last_name ###
#### (String, **required**)

Entered by the end-user, this is supposedly the last name appearing on the document.

This is a _claim_, not fact, until you have verified that indeed this field matches the images supplied.

### claimed_personal_details.gender ###
#### (String, **required**)

Entered by the end-user, this is supposedly the gender appearing on the document.

This is a _claim_, not fact, until you have verified that indeed this field matches the images supplied.

### claimed_personal_details.date_of_birth ###
#### (Date, **required**)

Entered by the end-user, this is supposedly the date of birth appearing on the document.

This is a _claim_, not fact, until you have verified that indeed this field matches the images supplied.

### claimed_address ###
#### (Address, **required**)

Entered by the end-user, this is supposedly the address appearing on the document.

This is a _claim_, not fact, until you have verified that indeed this field matches the images supplied.

### claimed_document.type ###
#### (String, **required**)

Type of the document supplied.

This is supplied by the end-user, and Simplex uses that in order to ask the end-user for the relevant pages/sides: identity cards and passports, for example, will usually have just one page/side supplied, whereas a driver's license will have two.

This too is a claim, and you are asked to verify that the images supplied indeed are of a document of this type.

### claimed_document.number ###
#### (String, **required**)

Entered by the end-user, this is supposedly the official number appearing on the document.

This is a _claim_, not fact, until you have verified that indeed this field matches the images supplied.

The format is not fixed, as different documents in different countries have different forms of what constitutes a "document number".

### claimed_document.expiration ###
#### (Date, **required**)

Entered by the end-user, this is supposedly the last day at which the document is still valid.

This is a _claim_, not fact, until you have verified that indeed this field matches the images supplied.

### claimed_document.issuing_country ###
#### (String, **required**)

TODO

### document_images ###
#### (List\<DocumentPageImage\>, **required**)

TODO

## Response ##

> An example response:

```json
{
  "poid_id": "poid:3209830",
  "status": "pending"
}
```

Name    | Type   |   |
------- | ------ | - |
poid_id | Id     | **requried**
status  | String | **required**
outcome | String | **required** if `status == "completed"`, missing otherwise

### poid_id ###
#### (Id, **required**)

An opaque string generated by you and stored by Simplex.

You may use this identifier to notify Simplex of the status and outcome of the verification process once the status changes (e.g. moves from `"pending"` to `"completed"`), and Simplex may use this identifier to query you regarding the status and outcome of the verification process.

### status ###
#### (String, **required**)

One of { `"completed"`, `"pending"`, `"failed"` }.

### outcome ###
#### (String, **required** if `status == "completed"`, missing otherwise)

The outcome of the verification process.

`"success"`: all details match.

`"soft_fail"`: the verification process cannot proceed (e.g. image is blurry, country is not supported, etc.). This is not necessarily an indication of data mismatch.

`"hard_fail"`: mismatch between entered data and the images provided, or the images are not trustworthy.

## p/REST ##

If you supply a p/REST endpoint for this API, Simplex will use  
<span class="http-verb http-get">GET</span> `https://${YOUR_API_URL}/poid`

## MsgQueue ##

Alternatively, you may receive this request as a message of type `"poid"` in  
<span class="http-verb http-get">GET</span> `https://api.simplexcc.com/v1/msg`

You respond by  
<span class="http-verb http-post">POST</span> `https://api.simplexcc.com/v1/msg/:msg-id/response`

You will need to also acknowledge receipt of the message, by  
<span class="http-verb http-post">POST</span> `https://api.simplexcc.com/v1/msg/:msg-id/ack`

[modeline]: # ( vim: set ts=2 sw=2 expandtab wrap linebreak: )
