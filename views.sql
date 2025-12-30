-- ## OVERVIEW ## --
SELECT 
    machine_name,
    COUNT(*) as total_heartbeats,
    ROUND(AVG(cpu_load)::numeric, 2) as avg_cpu,
    MAX(cpu_load) as peak_cpu,
    ROUND(AVG(ram_usage)::numeric, 2) as avg_ram
FROM system_heartbeat
GROUP BY machine_name;

-- ## CPU SPIKE ANALYSIS -- ##

SELECT
  machine_name,
  cpu_load,
  LAG(cpu_load) OVER (PARTITION BY machine_name ORDER BY recorded_at) as previous_cpu_load,
  cpu_load - LAG(cpu_load) OVER (PARTITION BY machine_name ORDER BY recorded_at) as cpu_delta,
  recorded_at
FROM system_heartbeat
ORDER BY ABS(cpu_load - LAG(cpu_load) OVER (PARTITION BY machine_name ORDER BY recorded_at)) DESC;
