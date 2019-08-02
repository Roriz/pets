# Stack
```
ruby: 2.6
rails: 6.0.0.rc2
postgres: 11
docker: 19.03
docker-compose: 1.24
```

## First run
```shell
cp .env.example .env
docker-compose up
```

## How create a new secret
```shell
docker exec -it pets_api_1 rake secret
```

## About
see more in [instructions](/instructions.md)
