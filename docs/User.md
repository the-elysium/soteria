# User

## Sign up

With email confirm_success_url:
```
curl -i -X POST -H "Content-Type: application/json" -d '{"email":"aa@bb.cc", "password":"00000000", "password_confirmation":"00000000", "confirm_success_url":"/"}' http://localhost:3000/auth/
```

Without email confirm_success_url: via `config/initializers/devise_token_auth.rb`

```
curl -i -X POST -H "Content-Type: application/json" -d '{"email":"aa@bb.cc", "password":"00000000", "password_confirmation":"00000000"}' http://localhost:3000/auth/
```


Success:
```
HTTP/1.1 200 OK
access-token: aUpk6SRTiGxltW4e6Ov_cg
token-type: Bearer
client: YC1B7SK0g-AsW2rfscMFRA
expiry: 1518238001
uid: aa@bb.cc
Content-Type: application/json; charset=utf-8
ETag: W/"2b9e1a6487e5d64abb7a8d3ccd006ce1"
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 58d71f5e-fc4b-4ec6-a1b7-9e37289c1a4f
X-Runtime: 0.210734
Transfer-Encoding: chunked

{"status":"success","data":{"id":1,"email":"aa@bb.cc","provider":"email","uid":"aa@bb.cc","name":null,"nickname":null,"image":null,"created_at":"2018-01-27T04:46:41.745Z","updated_at":"2018-01-27T04:46:41.881Z"}
```

## Login
```
curl -i -X POST -H "Content-Type: application/json" -d '{"email":"aa@bb.cc", "password":"00000000"}' http://localhost:3000/auth/sign_in
```

Success:
```
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8
access-token: TdDDojrAQJDj81E1Qi1cwQ
token-type: Bearer
client: cy0PoVw5d2UASRB9KbItVA
expiry: 1518238036
uid: aa@bb.cc
ETag: W/"8c664722f8eaeaaf2ace9d92751c3ecf"
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: d8255431-8864-4071-adc5-48ae3c15e7fa
X-Runtime: 0.201309
Transfer-Encoding: chunked

{"data":{"id":1,"email":"aa@bb.cc","provider":"email","uid":"aa@bb.cc","name":null,"nickname":null,"image":null}}
```


## Logout
```
curl -i -X DELETE -H "Content-Type: application/json" -H "uid: aa@bb.cc" -H "client: kLGHr33z8qq_Pqzp-0_HsQ" -H "access-token: MVHr3IxGdTnpZKWHzG_d-Q" http://localhost:3000/auth/sign_out
```

Success:
```
{
    "success": true
}
```


## Current user info
```
curl -i -X GET -H "Content-Type: application/json" -H 'uid: aa@bb.cc' -H 'client: Yoo49xZm0GqRfmAT3aDqRQ' -H 'access-token: W0CBDR62I5O_XZvujs8zdQ' http://localhost:3000/user

```

Success:
```
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8
access-token: W0CBDR62I5O_XZvujs8zdQ
token-type: Bearer
client: Yoo49xZm0GqRfmAT3aDqRQ
expiry: 1518241405
uid: aa@bb.cc
ETag: W/"238c234823ecaca7217fb148fae17444"
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 65b6945f-7b70-438e-aece-0f474d7a3bd6
X-Runtime: 0.121853
Transfer-Encoding: chunked

{"id":1,"provider":"email","uid":"aa@bb.cc","name":null,"nickname":null,"image":null,"email":"aa@bb.cc","created_at":"2018-01-27T04:46:41.745Z","updated_at":"2018-01-27T05:43:25.938Z"}
```




