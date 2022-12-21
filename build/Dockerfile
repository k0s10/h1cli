FROM golang:alpine3.15 AS builder
WORKDIR /app

COPY ./builder/* ./

RUN go build -o ./run

FROM bellsoft/liberica-openjdk-alpine:11

COPY ./site/* /h1cli/
COPY ./1c /tmp/
COPY --from=builder /app/run /h1cli/
RUN cd /tmp/ && \
  ./1ce-installer-cli install --ignore-signature-warnings

#EXPOSE 4500
WORKDIR /h1cli
ENTRYPOINT ["./run"]
