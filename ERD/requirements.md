# ER Diagram Requirements

## Objective
Create an Entity-Relationship (ER) Diagram for the Airbnb-like database system. This diagram will serve as the blueprint for the database schema, defining entities, their attributes, and the relationships among them.

## Entities and Attributes

1. **User**
   - `user_id` (Primary Key, UUID)
   - `first_name` (VARCHAR, NOT NULL)
   - `last_name` (VARCHAR, NOT NULL)
   - `email` (VARCHAR, UNIQUE, NOT NULL)
   - `password_hash` (VARCHAR, NOT NULL)
   - `phone_number` (VARCHAR, NULL)
   - `role` (ENUM: guest, host, admin)
   - `created_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

2. **Property**
   - `property_id` (Primary Key, UUID)
   - `host_id` (Foreign Key, references User)
   - `name` (VARCHAR, NOT NULL)
   - `description` (TEXT, NOT NULL)
   - `location` (VARCHAR, NOT NULL)
   - `pricepernight` (DECIMAL, NOT NULL)
   - `created_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
   - `updated_at` (TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP)

3. **Booking**
   - `booking_id` (Primary Key, UUID)
   - `property_id` (Foreign Key, references Property)
   - `user_id` (Foreign Key, references User)
   - `start_date` (DATE, NOT NULL)
   - `end_date` (DATE, NOT NULL)
   - `total_price` (DECIMAL, NOT NULL)
   - `status` (ENUM: pending, confirmed, canceled)
   - `created_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

4. **Payment**
   - `payment_id` (Primary Key, UUID)
   - `booking_id` (Foreign Key, references Booking)
   - `amount` (DECIMAL, NOT NULL)
   - `payment_date` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
   - `payment_method` (ENUM: credit_card, paypal, stripe)

5. **Review**
   - `review_id` (Primary Key, UUID)
   - `property_id` (Foreign Key, references Property)
   - `user_id` (Foreign Key, references User)
   - `rating` (INTEGER, CHECK: 1–5, NOT NULL)
   - `comment` (TEXT, NOT NULL)
   - `created_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

6. **Message**
   - `message_id` (Primary Key, UUID)
   - `sender_id` (Foreign Key, references User)
   - `recipient_id` (Foreign Key, references User)
   - `message_body` (TEXT, NOT NULL)
   - `sent_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

## Relationships

- **User – Property**
  - One user (`host`) can have many properties.
- **User – Booking**
  - One user (`guest`) can have many bookings.
- **User – Review**
  - One user can write many reviews.
- **User – Message**
  - Users can send and receive many messages.
- **Property – Booking**
  - One property can have many bookings.
- **Property – Review**
  - One property can have many reviews.
- **Booking – Payment**
  - Each booking has one payment.

## Instructions

- Use **Draw.io**, **Lucidchart**, or any other ER diagram tool.
- Represent all entities and attributes clearly.
- Show all primary and foreign key relationships.
- Indicate cardinality (e.g., one-to-many).
- Export the diagram in **PNG** or **PDF** format.
- Save your diagram file in this directory (`ERD/`) as:
  - `airbnb_erd.png` or `airbnb_erd.pdf`.

## Submission

- Commit and push your diagram to your

