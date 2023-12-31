# Use the official Ubuntu 22.04 image as the base image
FROM ubuntu:22.04

# Update package lists and install dependencies
RUN apt-get update -y && \
    apt-get install -y python3-pip

# Install dump1090exporter using pip
RUN pip3 install dump1090exporter

# Expose the default port used by dump1090exporter
EXPOSE 9105

# Set environment variables
ENV DUMP1090_URL=http://localhost:8080/data
ENV EXPORTER_HOST=0.0.0.0
ENV EXPORTER_PORT=9105
ENV AIRCRAFT_INTERVAL=10
ENV STATS_INTERVAL=60
ENV RECEIVER_INTERVAL=10
ENV RECEIVER_LATITUDE=""
ENV RECEIVER_LONGITUDE=""
ENV LOG_LEVEL=info

# Command to run dump1090exporter with environment variables
CMD dump1090exporter \
    --resource-path $DUMP1090_URL \
    --host $EXPORTER_HOST \
    --port $EXPORTER_PORT \
    --aircraft-interval $AIRCRAFT_INTERVAL \
    --stats-interval $STATS_INTERVAL \
    --receiver-interval $RECEIVER_INTERVAL \
    --latitude $RECEIVER_LATITUDE \
    --longitude $RECEIVER_LONGITUDE \
    --log-level $LOG_LEVEL

