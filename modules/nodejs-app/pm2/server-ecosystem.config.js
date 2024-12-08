module.exports = {
  apps : [
    {
      name: "server-app",
      script: "/app/mobil-webshop-server/src/index.js",
      watch: true,
      env: {
          "SERVER_MONITORING_HOST": "172.18.0.3",
          "SERVER_PORT":  "5000",
          "MONGODB_HOST": "172.100.0.30",
          "MONGODB_PORT": "27017",
          "MONGODB_DB": "my_db",
          "CLIENT_HOST": "172.200.0.20",
          "CLIENT_PORT": "4200",
          "PROMETHEUS_HOST": "172.100.0.70",
          "PROMETHEUS_PORT": "4000"
      }
    }
  ]
}
