# Partitioning Performance Report – ALX Airbnb Database

## Objective

To improve query performance on the large `bookings` table by partitioning it based on the `start_date` column.

---

## Implementation

The `bookings_partitioned` table was created using `RANGE` partitioning based on the **year** of `start_date`. This allowed MySQL to eliminate entire partitions when filtering by date ranges.

Partition definitions:
- `p2019`: bookings before 2020
- `p2020`: bookings in 2020
- `p2021`: bookings in 2021
- `p2022`: bookings in 2022
- `pmax`: bookings from 2023 onwards

---

## Performance Test

**Query used:**
```sql
EXPLAIN SELECT * FROM bookings_partitioned
WHERE start_date BETWEEN '2021-01-01' AND '2021-12-31';
