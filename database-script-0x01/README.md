# Airbnb Database Schema

This SQL script defines the relational schema for an Airbnb-like application.

## Features

- 6 main tables:
  - User
  - Property
  - Booking
  - Payment
  - Review
  - Message
- Proper data types and constraints:
  - UUID primary keys
  - Foreign keys with `ON DELETE CASCADE`
  - ENUM-like constraints using CHECK
  - NOT NULL constraints on essential fields
- Indexes for query optimization:
  - User email (unique index)
  - Property location
  - Booking status
  - Review rating
  - Message recipient

## Usage

1. **PostgreSQL UUID Extension:**
   If you are using PostgreSQL, enable UUID generation:
   ```sql
   CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

