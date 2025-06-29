# Airbnb Database Seed Data

This script populates the Airbnb-like database with realistic sample data for testing and development.

## Included Data

- **Users:**
  - 4 users (2 hosts, 2 guests)

- **Properties:**
  - 2 properties listed by hosts

- **Bookings:**
  - 2 bookings (one confirmed, one pending)

- **Payments:**
  - 1 payment record

- **Reviews:**
  - 2 reviews with ratings and comments

- **Messages:**
  - 2 example message exchanges

## Usage

1. Make sure you have already created the schema tables (`schema.sql`).
2. Run this script to insert sample data:
   ```bash
   psql -U your_user -d your_database -f seed.sql
