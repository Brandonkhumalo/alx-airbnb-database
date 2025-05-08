# Airbnb Clone - Database Schema

## Directory: database-script-0x01

This directory contains the database schema SQL script for the Airbnb clone project.

### Files

- `schema.sql`: Contains SQL CREATE TABLE statements and constraints for the main entities: Users, Properties, Bookings, Payments, Reviews, and Messages.
- `README.md`: This file. Describes the schema contents and structure.

### Schema Overview

The schema supports the following entities:

- `users`: Registered individuals (guests, hosts, admins).
- `properties`: Listings hosted by users.
- `bookings`: Reservations made by users for properties.
- `payments`: Payment records linked to bookings.
- `reviews`: Feedback left by users for properties.
- `messages`: Communication between users.

### Features

- All primary keys are UUIDs.
- Appropriate foreign key constraints.
- ENUM types for roles, booking status, and payment methods.
- Timestamps for auditability.
- Indexes for efficient query performance.

### Usage

Run the following command in your SQL environment:

```bash
mysql -u username -p database_name < schema.sql

