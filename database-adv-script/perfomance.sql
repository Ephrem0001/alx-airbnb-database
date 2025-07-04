-- Analyze performance of the initial complex query

EXPLAIN ANALYZE
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    u.user_id,
    u.name AS user_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.payment_date
FROM
    bookings b
JOIN
    users u ON b.guest_id = u.user_id
JOIN
    properties p ON b.property_id = p.property_id
LEFT JOIN
    payments pay ON b.booking_id = pay.booking_id
WHERE
    b.start_date >= '2023-01-01'
    AND pay.amount > 0
ORDER BY
    b.start_date;
