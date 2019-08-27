FROM golang:1.12.7 as builder
WORKDIR /app
ADD . /app
RUN make prepare && \
    make dep && \
	apt-get update && apt-get install unzip && \
    make oracle-instantclient && \
    make build && \
    mkdir build && \
    cp -p ./src/go-oracle/go-oracle ./build && \
    cp -rp ./resources ./build

FROM golang:1.12.7
RUN mkdir -p /app
WORKDIR /app
COPY --from=builder /app/build /app
RUN apt-get update && apt-get install libaio1 && \
    cp -p ./resources/oci8.pc /usr/lib/pkgconfig && \
    cp -p ./resources/oci8.conf /etc/ld.so.conf.d && \
    ldconfig
CMD ["./go-oracle"]
