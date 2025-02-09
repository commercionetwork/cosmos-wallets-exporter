# To build use: docker build -t cosmos-wallets-exporter .
# Start from the latest golang base image
FROM golang:latest

# Add Maintainer Info
LABEL maintainer="Marco Ruaro <marco.ruaro@gmail.com>"

# Set the working directory
WORKDIR /app

# Copy the current directory to the container
COPY . /app

# Execute make install
RUN make install

# Execute make install
RUN make build

ARG CONFIG_DIR=/app/config
RUN mkdir -p ${CONFCONFIG_DIRI_DIR}
VOLUME [${CONFIG_DIR}]


# Command to run the application
CMD [ "/app/cosmos-wallets-exporter" ]