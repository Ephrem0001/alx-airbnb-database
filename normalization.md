# Database Normalization

## Objective
Apply normalization principles to ensure the Airbnb database design is in **Third Normal Form (3NF)** to optimize efficiency, reduce redundancy, and ensure data integrity.

---

## Normalization Process

Below is a description of how each normal form was achieved in this schema.

---

### 1NF – First Normal Form
**Definition:**  
A relation is in 1NF if:
- All attributes contain atomic (indivisible) values.
- There are no repeating groups or arrays.

**Actions Taken:**  
 All tables were designed with atomic columns:
- No arrays, lists, or multiple values per column.
- Each field contains exactly one value per row (e.g., one email per user, one role per user).

Example:  
`phone_number` is a single VARCHAR field per user.  
`payment_method` is an ENUM, enforcing a single method per payment.

**Status:**  
 All tables conform to 1NF.

---

### 2NF – Second Normal Form
**Definition:**  
A relation is in 2NF if:
- It is in 1NF.
- All non-key attributes are fully functionally dependent on the entire primary key.

**Analysis:**
- All tables have a **single-column primary key** (UUID).
- No tables have composite primary keys.
- Therefore, no partial dependencies are possible.

**Status:**  
✔ All tables conform to 2NF without modification.

---

### 3NF – Third Normal Form
**Definition:**  
A relation is in 3NF if:
- It is in 2NF.
- There are no transitive dependencies (i.e., no non-key attribute depends on another non-key attribute).

**Analysis and Justification:**

 **User Table**
- All attributes depend solely on `user_id`.
- No transitive dependencies (e.g., `role` does not depend on `email`).

 **Property Table**
- `host_id` references `User`.
- All other attributes describe the property itself.
- No transitive dependencies between `name`, `description`, etc.

 **Booking Table**
- All non-key fields describe the booking event.
- `total_price` is derived but stored to improve performance. This can be justified as a denormalization optimization, but strictly speaking it does not introduce transitive dependency because it depends on `booking_id`.

 **Payment Table**
- Each payment is associated with exactly one booking.
- All attributes describe that payment.

 **Review Table**
- All fields directly describe the review record.

 **Message Table**
- All fields depend only on `message_id`.

**Status:**
✔ All tables conform to 3NF.

---

## Summary of Findings
- **No redesign** was necessary because the initial schema was already normalized to 3NF.
- No repeating groups, partial dependencies, or transitive dependencies were identified.
- The schema is optimized for data integrity and reduction of redundancy.

---

## Notes on Performance
- In some production systems, limited controlled denormalization (e.g., caching `total_price`) can be used for performance.
- Indexes and constraints will be defined in the schema SQL scripts.

---

## Conclusion
The Airbnb database schema adheres fully to **Third Normal Form (3NF)**.  
This design ensures:
- Minimal redundancy
- Strong data integrity
- Scalable structure suitable for a real-world application.

