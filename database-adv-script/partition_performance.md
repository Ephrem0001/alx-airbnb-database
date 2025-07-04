# Partitioning Performance Report

## Context

The `bookings` table had a large volume of data, leading to slow query performance when filtering by date ranges.

## Steps Taken

- Created a new partitioned table `bookings_partitioned` partitioned by `start_date`.
- Defined yearly partitions for 2022, 2023, and 2024.
- Migrated data from the original `bookings` table into partitions.

## Performance Testing

### Query Tested

```sql
SELECT
    booking_id,
    guest_id,
    property_id,
    start_date,
    end_date
FROM
    bookings_partitioned
WHERE
    start_date BETWEEN '2023-01-01' AND '2023-12-31'
ORDER BY
    start_date;
