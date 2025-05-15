# SQL Database Tasks & Performance Optimization

This repository contains various SQL scripts and queries focusing on common database operations, advanced querying techniques, and performance tuning strategies.

---

## Contents

- **subqueries.sql**  
  Contains examples of correlated and non-correlated subqueries:  
  - Find properties with average rating > 4.0 (non-correlated subquery)  
  - Find users who have made more than 3 bookings (correlated subquery)  

- **aggregation_and_window_functions.sql**  
  Uses SQL aggregation and window functions to:  
  - Count total bookings per user  
  - Rank properties based on total bookings using `ROW_NUMBER()` or `RANK()`  

- **database_index.sql**  
  Creates indexes on high-usage columns (e.g., columns used in WHERE, JOIN, ORDER BY) for tables like User, Booking, and Property.  
  Includes recommendations for indexes and shows how to measure query performance before and after indexing using `EXPLAIN` or `ANALYZE`.

- **initial_query.sql**  
  Retrieves all bookings with joined details from Users, Properties, and Payments tables.  

- **query_optimization.sql**  
  - Analyzes performance of the initial query using `EXPLAIN`  
  - Identifies inefficiencies (e.g., unnecessary joins)  
  - Refactors query and adds indexes to improve execution time  

- **partitioning.sql**  
  Implements table partitioning on the Booking table based on the `start_date` column to improve query performance on large datasets.  

- **partition_performance_report.md**  
  Reports on query performance improvements observed after partitioning, including execution times before and after partitioning.

- **performance_monitoring.sql**  
  Uses `EXPLAIN ANALYZE` and `SHOW PROFILE` to monitor performance of frequent queries.  
  Identifies bottlenecks and applies schema/index adjustments.  
  Reports on improvements after changes.

---

## How to Use

1. Review each SQL script to understand its purpose and implementation.
2. Run scripts sequentially on your database to replicate tasks and optimizations.
3. Use `EXPLAIN`, `EXPLAIN ANALYZE`, or `SHOW PROFILE` commands to analyze query performance.
4. Observe the performance improvements after applying indexes and partitioning.
5. Refer to `partition_performance_report.md` and the README for context and findings.

---

## Key Learnings

- **Subqueries:** Differentiate between correlated and non-correlated subqueries to write efficient queries.
- **Aggregation & Window Functions:** Use aggregate functions with `GROUP BY` and ranking functions like `ROW_NUMBER()` to analyze data.
- **Indexing:** Identify columns frequently used in WHERE and JOIN conditions to create appropriate indexes that significantly reduce query times.
- **Query Optimization:** Analyze execution plans to spot bottlenecks and refactor queries by removing unnecessary joins or conditions.
- **Partitioning:** Implement partitioning strategies on large tables to improve query speed and manageability.
- **Continuous Monitoring:** Regularly profile queries and adjust schemas/indexes to maintain optimal database performance.

---

## Recommendations

- Always analyze your queries with execution plans before and after changes.
- Start with indexing on high-usage columns to gain quick performance wins.
- Use partitioning for very large tables or when queries often filter by date/range.
- Combine indexing with query refactoring for best results.
- Continuously monitor performance as data grows and usage patterns change.

---

## Contact

For questions or suggestions, feel free to open an issue or contact the repository owner.

---

*Happy querying and optimizing!*
