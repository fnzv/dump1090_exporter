# dump1090exporter Docker Image



This Docker image provides an environment to run `dump1090exporter`, a tool for exporting ADS-B data from `dump1090` to Prometheus.

## Usage

### Build the Docker Image

```bash
docker build -t dump1090exporter:latest .
```

Running the image:

```
docker run -d -p 9105:9105 --name dump1090exporter dump1090exporter:latest
```

#Environment Variables

You can customize the behavior of dump1090exporter by setting the following environment variables:
```
    DUMP1090_URL: URL of the dump1090 instance. Default: http://localhost:8080/data
    EXPORTER_HOST: Host on which the exporter will listen. Default: 0.0.0.0
    EXPORTER_PORT: Port on which the exporter will run. Default: 9105
    AIRCRAFT_INTERVAL: Interval (in seconds) for aircraft data collection. Default: 10
    STATS_INTERVAL: Interval (in seconds) for collecting dump1090 stats. Default: 60
    RECEIVER_INTERVAL: Interval (in seconds) for collecting receiver stats. Default: 10
    RECEIVER_LATITUDE: Latitude of the receiver location. Default: "" (empty string)
    RECEIVER_LONGITUDE: Longitude of the receiver location. Default: "" (empty string)
    LOG_LEVEL: Logging level for dump1090exporter. Default: info
```

# Example Run with Customized Parameters

```
docker run -d -p 9105:9105 \
    -e DUMP1090_URL=http://dump1090-instance:8080/data \
    -e EXPORTER_HOST=127.0.0.1 \
    -e EXPORTER_PORT=9191 \
    -e AIRCRAFT_INTERVAL=15 \
    -e STATS_INTERVAL=120 \
    -e RECEIVER_INTERVAL=15 \
    -e RECEIVER_LATITUDE=37.7749 \
    -e RECEIVER_LONGITUDE=-122.4194 \
    -e LOG_LEVEL=debug \
    --name dump1090exporter dump1090exporter:latest
```

# Access the Metrics

Once the container is running, you can access the metrics from Prometheus at http://localhost:9105/metrics.
