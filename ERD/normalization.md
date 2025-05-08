# Database Normalization to Third Normal Form (3NF)

## Objective
To ensure the Airbnb-style booking database is fully normalized and adheres to the principles of 3NF, thereby eliminating redundancy and improving data integrity.

---

## Step 1: First Normal Form (1NF)
Requirements:
- Atomic values (no repeating groups or arrays).
- Unique rows with a primary key.

✅ Applied:
- All entities (User, Property, Booking, Payment, Review, Message) use UUIDs as primary keys.
- Each field contains atomic values (e.g., no multi-valued fields).

---

## Step 2: Second Normal Form (2NF)
Requirements:
- Must be in 1NF.
- No partial dependencies; all non-key attributes must depend on the whole primary key.

✅ Applied:
- All tables have single-column primary keys (UUIDs).
- Non-key attributes in each table are fully functionally dependent on their respective primary keys.

Examples:
- In the Booking table, attributes like start_date, end_date, and total_price depend entirely on booking_id.
- No partial dependencies are present.

---

## Step 3: Third Normal Form (3NF)
Requirements:
- Must be in 2NF.
- No transitive dependencies; non-key attributes must not depend on other non-key attributes.

✅ Applied:
- User table: Attributes like first_name, last_name, email, etc., depend only on user_id.
- Property table: All attributes depend on property_id; host_id is a foreign key, not a transitive dependency.
- Booking table: status, start_date, end_date, total_price depend only on booking_id.
- Payment table: amount and payment_method depend only on payment_id.
- Review table: rating and comment depend only on review_id.
- Message table: sender_id and recipient_id are foreign keys; message_body depends only on message_id.

There are no transitive dependencies in any table.

---

## Conclusion
The database schema adheres to 3NF by:
- Eliminating repeating and multi-valued fields (1NF).
- Ensuring all non-key attributes are fully dependent on the primary key (2NF).
- Eliminating transitive dependencies (3NF).

This results in:
- Better data integrity
- Reduced redundancy
- Easier maintenance and scalability
