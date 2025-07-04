-- 1. Create a partitioned bookings table

CREATE TABLE bookings_partitioned (
    booking_id SERIAL PRIMARY KEY,
    guest_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (start_date);

-- 2. Create partitions for each year

CREATE TABLE bookings_2022 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2022-01-01') TO ('2023-01-01');

CREATE TABLE bookings_2023 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE bookings_2024 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

-- 3. Insert data from the original bookings table into the partitioned table
INSERT INTO bookings_partitioned (booking_id, guest_id, property_id, start_date, end_date, created_at)
SELECT booking_id, guest_id, property_id, start_date, end_date, created_at
FROM bookings;

-- 4. Verify partitions
SELECT
    table_name,
    parent_table
FROM
    information_schema.partitions
WHERE
    parent_table = 'bookings_partitioned';
