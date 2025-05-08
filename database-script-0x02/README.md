# Airbnb Clone – Database Seed Script

## Directory: database-script-0x02

This directory contains SQL scripts to populate the database with sample data for testing and development.

### Files

- `seed.sql`: Populates tables with sample users, properties, bookings, payments, reviews, and messages.
- `README.md`: Documentation describing the script and its purpose.

### Sample Data Includes

- 3 Users: guest, host, and admin
- 2 Properties owned by a host
- 2 Bookings made by a guest
- 1 Payment made for a booking
- 2 Reviews from the guest for properties
- 2 Messages exchanged between users

### Usage

Ensure your schema has been created (see schema.sql from database-script-0x01), then run:

```bash
mysql -u username -p database_name < seed.sql

