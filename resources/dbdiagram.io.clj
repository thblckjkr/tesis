// dbdiagram.io

Table "station_additionals" {
  "id" INT [not null, increment]
  "key" VARCHAR(255) [not null]
  "value" VARCHAR(255) [not null]
  "station_id" CHAR(36) [not null]
  "created_at" TIMESTAMP [default: `CURRENT_TIMESTAMP`]
  "updated_at" TIMESTAMP [default: `CURRENT_TIMESTAMP`]
}

Table "station_events" {
  "id" INT [not null, increment]
  "station_id" CHAR(36) [not null]
  "event_type" VARCHAR(255) [not null]
  "event_path" VARCHAR(255) [not null]
  "event_data" VARCHAR(255) [not null]
  "deleted_at" DATETIME
  "created_at" TIMESTAMP [default: `CURRENT_TIMESTAMP`]
  "updated_at" TIMESTAMP [default: `CURRENT_TIMESTAMP`]
}

Table "stations" {
  "id" CHAR(36) [not null]
  "name" VARCHAR(255) [not null]
  "ip" INT [not null]
  "port" INT [not null]
  "username" VARCHAR(255) [not null]
  "has_key" TINYINT(1) [not null]
  "deleted_at" DATETIME
  "created_at" TIMESTAMP [default: `CURRENT_TIMESTAMP`]
  "updated_at" TIMESTAMP [default: `CURRENT_TIMESTAMP`]
}


Ref: "station_additionals"."station_id" > "stations"."id"

Ref: "station_events"."station_id" > "stations"."id"