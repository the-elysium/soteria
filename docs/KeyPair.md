# KeyPair

## get my keys

```
curl -i -X GET -H "Content-Type: application/json" -H 'uid: aa@bb.cc' -H 'client: Yoo49xZm0GqRfmAT3aDqRQ' -H 'access-token: W0CBDR62I5O_XZvujs8zdQ' http://localhost:3000/key_pair

```


## create keys
```
curl -i -X POST -H "Content-Type: application/json" -H 'uid: aa@bb.cc' -H 'client: Yoo49xZm0GqRfmAT3aDqRQ' -H 'access-token: W0CBDR62I5O_XZvujs8zdQ' -d '{"pk_password":12345, "keep_private_key":true, "keep_pk_password":true}' http://localhost:3000/key_pair
```

Success:
```
{
    "status": 200,
    "data": {
        "public_key": "<public key>",
        "private_key": "<private key>"
    }
}
```

## upload keys


## update keys
Not Implemented






