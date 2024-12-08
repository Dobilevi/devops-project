module.exports = {
  apps : [
    {
      name: "server-app",
      script: "/app/mobil-webshop-server/src/index.js",
      watch: true,
      env: {
          "SERVER_PORT":  "5000",
          "MONGODB_HOST": "172.100.0.35",
          "MONGODB_PORT": "27017",
          "MONGODB_DB": "my_db",
          "CLIENT_HOST": "localhost",
          "CLIENT_PORT": "4201",
          "PROMETHEUS_HOST": "172.100.0.70",
          "PROMETHEUS_PORT": "4000"
      }
    }
  ]
}
