SELECT
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    u.user_id,
    u.name As guest_name,
    u.email
FROM
    booking b
INNER JOIN
    users u
ON
    b.guest_id = u.user_id;
