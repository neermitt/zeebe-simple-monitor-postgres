ARG ZEEBE_SIMPLE_MONITOR_VERSION=0.19.1
ARG POSTGRES_DRIVER_VERSION=42.2.18

FROM alpine AS download_postgres

WORKDIR /

ARG POSTGRES_DRIVER_VERSION
RUN wget https://jdbc.postgresql.org/download/postgresql-${POSTGRES_DRIVER_VERSION}.jar

FROM camunda/zeebe-simple-monitor:${ZEEBE_SIMPLE_MONITOR_VERSION}
ARG POSTGRES_DRIVER_VERSION
COPY --from=download_postgres /postgresql-${POSTGRES_DRIVER_VERSION}.jar /app/libs/postgresql-${POSTGRES_DRIVER_VERSION}.jar

