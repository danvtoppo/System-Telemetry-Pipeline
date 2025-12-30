CREATE TABLE IF NOT EXISTS system_heartbeat(
  id SERIAL PRIMARY KEY, 
  machine_name TEXT, 
  cpu_load REAL,
  ram_usage REAL,
  recorded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
  );
