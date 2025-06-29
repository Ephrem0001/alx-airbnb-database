-- ===========================================================
-- Airbnb Database Schema
-- ===========================================================

-- Enable UUID extension if using PostgreSQL
-- Uncomment if applicable:
-- CREATE EXTENSION IF NOT EXISTS "uuid-ossp";


-- Table: User

CREATE TABLE "User" (
    user_id UUID PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20),
    role VARCHAR(10) NOT NULL CHECK (role IN ('guest', 'host', 'admin')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- Table: Property

CREATE TABLE Property (
    property_id UUID PRIMARY KEY,
    host_id UUID NOT NULL,
    name VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    pricepernight DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_property_host
        FOREIGN KEY (host_id)
        REFERENCES "User"(user_id)
        ON DELETE CASCADE
);

-- Table: Booking

CREATE TABLE Booking (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    status VARCHAR(10) NOT NULL CHECK (status IN ('pending', 'confirmed', 'canceled')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_booking_property
        FOREIGN KEY (property_id)
        REFERENCES Property(property_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_booking_user
        FOREIGN KEY (user_id)
        REFERENCES "User"(user_id)
        ON DELETE CASCADE
);


-- Table: Payment

CREATE TABLE Payment (
    payment_id UUID PRIMARY KEY,
    booking_id UUID NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method VARCHAR(20) NOT NULL CHECK (payment_method IN ('credit_card', 'paypal', 'stripe')),
    CONSTRAINT fk_payment_booking
        FOREIGN KEY (booking_id)
        REFERENCES Booking(booking_id)
        ON DELETE CASCADE
);


-- Table: Review

CREATE TABLE Review (
    review_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    rating INTEGER NOT NULL CHECK (rating >= 1 AND rating <= 5),
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_review_property
        FOREIGN KEY (property_id)
        REFERENCES Property(property_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_review_user
        FOREIGN KEY (user_id)
        REFERENCES "User"(user_id)
        ON DELETE CASCADE
);


-- Table: Message

CREATE TABLE Message (
    message_id UUID PRIMARY KEY,
    sender_id UUID NOT NULL,
    recipient_id UUID NOT NULL,
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_message_sender
        FOREIGN KEY (sender_id)
        REFERENCES "User"(user_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_message_recipient
        FOREIGN KEY (recipient_id)
        REFERENCES "User"(user_id)
        ON DELETE CASCADE
);


-- Indexes

-- User email index (already UNIQUE)
CREATE INDEX idx_user_email ON "User"(email);

-- Property index on location for faster search
CREATE INDEX idx_property_location ON Property(location);

-- Booking index on status for filtering
CREATE INDEX idx_booking_status ON Booking(status);

-- Review index on rating for filtering/sorting
CREATE INDEX idx_review_rating ON Review(rating);

-- Message index on recipient_id for inbox queries
CREATE INDEX idx_message_recipient ON Message(recipient_id);

