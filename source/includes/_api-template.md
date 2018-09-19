# msg-name #

One line summary.

Longer explanation of when to use and what for.

## Synopsis ##

Message name: **`msg-name`**  
Direction: **You &larr; &rarr; Simplex**  
Transports: **REST, JWT, Message Queue Polling**

## Parameters ##

> Example request

```javascript--json
{
  "param_a": 1,
  "param_b": 2,
}
```

Name | Type | Required?
---- | ---- | ---------
param_a | type1 | required/optional
param_b | type2 | required/optional

### param_a ###
#### (type1, required/optional)

Explanation.

### param_b ###
#### (type2, required/optional)

Explanation.

## Response ##

> An example response:

```javascript--json
{
    "c": 3,
    "d": 4,
}
```

Name | Type
---- | ----
ret_c | tyep3
ret_d | type4

### ret_c ###
#### (type3)

Explanation.

### ret_d ###
#### (type4)

Explanation.

## Transports ##

### REST ###

<span class="http-verb http-get">GET</span>`https://api.simplexcc.com/v1/rest/:msg_name`

### JWT ###

<span class="http-verb http-get">GET</span>`https://api.simplexcc.com/v1/jwt/:msg_name`
