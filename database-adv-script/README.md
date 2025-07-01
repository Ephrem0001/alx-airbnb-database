# SQL Joins Queries

This project contains advanced SQL queries demonstrating different types of joins on an Airbnb-like database schema.

## Queries Included

1. **INNER JOIN:** Retrieve all bookings and the respective users who made those bookings.
2. **LEFT JOIN:** Retrieve all properties and their reviews, including properties without reviews.
3. **FULL OUTER JOIN:** Retrieve all users and all bookings, even if a booking has no user or a user has no bookings.

## How to Use

- Load your database.
- Run each query in `joins_queries.sql` to verify results.

## Notes

- FULL OUTER JOIN is emulated via `UNION` of LEFT JOIN and RIGHT JOIN for MySQL compatibility.

