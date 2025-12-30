# System-Telemetry-Pipeline# 

An ETL pipeline that captures real-time hardware telemetry and streams it to a **Neon PostgreSQL** cloud database.

## Stack
* **Language:** Python
* **Database:** [Neon](https://neon.tech/) (Serverless Postgres)
* **Libraries:** `psutil`, `psycopg2`

## Features
* **Real-time Extraction:** Polls CPU and RAM usage at 5-second intervals.
* **Cloud Ingestion:** Automates data loading into a remote PostgreSQL instance.
