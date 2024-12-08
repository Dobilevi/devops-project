# Felhő és DevOps

## Starting up

```sh
systemctl stop nginx
```

### Create docker volumes

```sh
docker volume create mongo-db-vol &&
docker volume create prometheus-vol
```

For demo purposes Jenkins and Grafana doesn't have an own volume.

### Start terraform

```sh
terraform init

terraform plan

terraform apply
```

## Jenkins

http://localhost:8080

`Username`: admin

`Password`: admin

### Run the CI/CD pipeline.

Dashboard -> CICD -> Build Now

## Angular app

### Production

http://localhost:4200

`Initialize the database by visiting` http://localhost:4200/

`E-Mail`: admin@mobilwebshop.com

`Password`: admin

### Test

http://localhost:4201

## Prometheus

http://localhost:9090

`Username`: admin

`Password`: admin

## Grafana

http://localhost:3000

`Username`: admin

`Password`: admin

## Nginx

(Between the Angular app and the NodeJS server.)

http://localhost/help

http://172.100.0.50/help
