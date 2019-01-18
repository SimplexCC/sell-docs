# poid #

A request from Simplex to you, asking that you verify a KYC proof-of-identity ("poid") document.

The request includes data entered by an end-user and scanned images of a document in support of the data. Simplex is asking that you verify that the images are legitimate and that the data in them matches that entered by the end-user.

This request from Simplex results in you creating a "poid-check".

Your response includes an identifier for the poid-check, which Simplex can use to query you about its status.

The status of a poid-check may be:

 * `"pending"` : the check is underway.

 * `"success"` : you completed the verification process, the images are authentic, and all details entered by the end-user match those in the images.

 * `"soft_fail"` : the verification process cannot proceed (e.g. images are blurry, country is not supported, etc.). This is not necessarily an indication of data mismatch.

 * `"hard_fail"` : mismatch between entered data and the images provided, images are not trustworthy, or person did not pass screening.

## Synopsis ##

API name: **`poid`**  
Direction: **Simplex &rarr; You**

## Parameters ##

> Example request:

```json
{
  "txn_id": "af492cb2-5b07-4318-8ece-be34f479e23b",
  "user_id": "1504241c7d83476aa3adcd54e2272d25",
  "user_aka_ids": [],

  "claimed_personal_details": {
    "first_name": "Wile",
    "last_name": "Coyote",
    "gender": "male",
    "date_of_birth": {
      "day": 17,
      "month": 9,
      "year": 1949
    }
  },

  "claimed_address": {
    "line1": "42 Desert Road",
    "city": "San Diego",
    "country": "US"
  },

  "claimed_document": {
    "type": "id_card",
    "number": "AT-83428798",
    "expiration": {
      "day": 16,
      "month": 9,
      "year": 2020
    },
    "issuing_country": "US"
  },

  "document_images": [{
    "page": "front",
    "url": "https://images.simplex.com/poid/67873999-9472-4b04-b419-12f2004309b1.jpg"
  }]
}
```

Name                      | Type                      |              | Description
------------------------- | ------------------------- | ------------ | -----------
                          |                           |              |
txn_id                    | Id                        | **required** |
user_id                   | Id                        | **required** |
user_aka_ids              | List<Id>                  | **required** |
                          |                           |              |
claimed_personal_details  |                           | **required** |
&emsp; first_name         | String                    | **required** |
&emsp; last_name          | String                    | **required** |
&emsp; gender             | String                    |              | One of { `"male"`, `"female"` }
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
url  | String | **required** | URL to image.

### txn_id ###
#### (Id, **required**)

The identifier of the Simplex transaction involved.

### user_id ###
#### (Id, **required**)

A unique identifier, created by Simplex, for the end-user performing the transaction.

Same `user_id` as a previous message means same end-user.

### user_aka_ids ###
#### (List<Id>, **required**)

A list of unique identifiers, on top of `user_id`, by which the user is also known.

### claimed_personal_details.first_name ###
#### (String, **required**)

Entered by the end-user, this is supposedly the first name appearing on the document.

This is a _claim_, not fact, until you have verified that indeed this field matches the images supplied.

### claimed_personal_details.last_name ###
#### (String, **required**)

Entered by the end-user, this is supposedly the last name appearing on the document.

This is a _claim_, not fact, until you have verified that indeed this field matches the images supplied.

### claimed_personal_details.gender ###
#### (String, optional)

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

Notes:

<p class="indent">
A state is required in the US, and is optional otherwise.
</p>

<p class="indent">
A zip is required, other than when the country does not have postal codes.
</p>

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

Entered by the end-user, this is supposedly the country that issued the document.

This is a _claim_, not fact, until you have verified that indeed this field matches the images supplied.

### document_images ###
#### (List\<DocumentPageImage\>, **required**)

A list of one or two images of the relevant page(s) of the document.

You are asked to verify that these images are authentic, and that the information in them matches that typed by the end-user (and supplied in the other parameters).

## Type PoidCheck ##

Name    | Type           |   |
------- | -------------- | - |
id      | Id             | **required**
status  | String         | **required**
result  | String         | **required** if `status == "completed"`
reasons | List\<String\> | **required** if `result != "success"`

### id ###
#### (Id, **required**)

An opaque string generated by you and stored by Simplex.

You may use this identifier to notify Simplex of the status of the proof-of-identity check once it changes, and Simplex may use this identifier to query you regarding the status of the proof-of-identity check.

### status ###
#### (String, **required**)

One of { `"pending"`, `"completed"` }.

### result ###
#### (String, **required** if `status == "completed"`)

One of { `"success"`, `"error"`, `"soft_fail"`, `"hard_fail"` }.

`"success"` : the POID check is approved.

`"error"` : a technical error has occurred, and there is no decision on the on the POID check.

`"soft_fail"` : the POID check cannot be approved, but it is possible to rectify the situation and try again.

`"hard_fail"` : the POID check is declined.

### reasons ###
#### (List\<String\>, **required** if `result != "success"`)

A list of short, descriptive reasons for the status.

**Note**: the strings will be displayed to the end-user, and thus need to be in English, short, descriptive, and proper.

## Response ##

> Example response:

```json
{
  "poid_check": {
    "id": "poid:3209830",
    "status": "completed",
    "result": "soft_fail",
    "reasons": ["first name not written exactly as in document"]
  }
}
```

Your response is a PoidCheck object. If its status is `"pending"` you will need to later notify Simplex when the status changes to "completed". You do this using the `poid-check-notify-status` message.

Alternatively, Simplex may poll you for the status, via either p/REST or MsgQueue, using `poid-check-get-status`.

Name       | Type      |   |
---------- | --------- | - |
poid_check | PoidCheck | **required**

## p/REST ##

If you supply a p/REST endpoint for this API, Simplex will use  
<span class="http-verb http-post">POST</span> `https://${YOUR_API_URL}/poid`

## MsgQueue ##

Alternatively, you may receive this request as a message of type `"poid"` in  
<span class="http-verb http-get">GET</span> `https://api.simplexcc.com/v1/msg`

You respond by  
<span class="http-verb http-post">POST</span> `https://api.simplexcc.com/v1/msg/:msg-id/response`

You will need to also acknowledge receipt of the message, by  
<span class="http-verb http-post">POST</span> `https://api.simplexcc.com/v1/msg/:msg-id/ack`

[modeline]: # ( vim: set ts=2 sw=2 expandtab wrap linebreak: )
