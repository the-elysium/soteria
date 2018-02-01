# System

## Get system public key

```
curl -i -X GET -H "Content-Type: application/json" http://localhost:3000/public_key
```


Success:
```
{
    "status": 200,
    "public_key": <public key content>
}
```