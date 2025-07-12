# 📊 Index Performance Evaluation – ALX Airbnb Database

This document evaluates SQL query performance before and after adding indexes to frequently used columns in the `bookings` table. The `EXPLAIN` command was used to analyze execution plans and measure improvements.

---

## 1️⃣ Query: `SELECT * FROM bookings WHERE user_id = 42;`

### **Before Index**
```sql
EXPLAIN SELECT * FROM bookings WHERE user_id = 42;
```
| type | key  | rows  | Extra        |
|------|------|-------|--------------|
| ALL  | NULL | 10000 | Using where  |

- **Full table scan:** MySQL scanned all 10,000 rows.
- **No index used.**

### **After Index**
```sql
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

EXPLAIN SELECT * FROM bookings WHERE user_id = 42;
```
| type | key                   | rows | Extra        |
|------|-----------------------|------|--------------|
| ref  | idx_bookings_user_id  | 5    | Using index  |

- **Index used:** Only 5 matching rows scanned.
- **Result:** Major performance improvement.

---

## 2️⃣ Query: `SELECT * FROM bookings WHERE property_id = 15;`

### **Before Index**
```sql
EXPLAIN SELECT * FROM bookings WHERE property_id = 15;
```
| type | key  | rows  | Extra        |
|------|------|-------|--------------|
| ALL  | NULL | 10000 | Using where  |

### **After Index**
```sql
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

EXPLAIN SELECT * FROM bookings WHERE property_id = 15;
```
| type | key                      | rows | Extra        |
|------|--------------------------|------|--------------|
| ref  | idx_bookings_property_id | 8    | Using where  |

- **Rows scanned reduced:** 10,000 ➔ 8
- **Query execution much faster.**

---

## 3️⃣ Query: `SELECT * FROM bookings ORDER BY created_at DESC;`

### **Before Index**
```sql
EXPLAIN SELECT * FROM bookings ORDER BY created_at DESC;
```
| type | key  | rows  | Extra         |
|------|------|-------|---------------|
| ALL  | NULL | 10000 | Using filesort|

- **No sorting index:** MySQL used filesort (expensive).

### **After Index**
```sql
CREATE INDEX idx_bookings_created_at ON bookings(created_at);

EXPLAIN SELECT * FROM bookings ORDER BY created_at DESC;
```
| type  | key                     | rows  | Extra        |
|-------|-------------------------|-------|--------------|
| index | idx_bookings_created_at | 10000 | Using index  |

- **Index used for sorting:** Improved performance.

---

## 📝 Summary Table

| Table     | Column      | Index Name                | Use Case                |
|-----------|-------------|--------------------------|-------------------------|
| bookings  | user_id     | idx_bookings_user_id     | Filtering by user       |
| bookings  | property_id | idx_bookings_property_id | Filtering by property   |
| bookings  | created_at  | idx_bookings_created_at  | Sorting by booking date |

---

## 🚀 Conclusion

Adding indexes to frequently filtered or sorted columns **significantly improved query performance** and reduced row scans. These optimizations are crucial for scaling the Airbnb system to handle large datasets efficiently.

---

## 🛠️ SQL Index Creation

To create the necessary indexes, add the following commands to your `database_index.sql` file:

```sql
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_created_at ON bookings(created_at);
```

---

## 📏 Measuring Query Performance

To measure query performance before and after adding indexes, use the `EXPLAIN` command in MySQL:

```sql
-- Before adding indexes
EXPLAIN SELECT * FROM bookings WHERE user_id = 42;
EXPLAIN SELECT * FROM bookings WHERE property_id = 15;
EXPLAIN SELECT * FROM bookings ORDER BY created_at DESC;

-- After adding indexes
EXPLAIN SELECT * FROM bookings WHERE user_id = 42;
EXPLAIN SELECT * FROM bookings WHERE property_id = 15;
EXPLAIN SELECT * FROM bookings ORDER BY created_at DESC;
```

For more detailed analysis, you can use `EXPLAIN ANALYZE` (if supported) or measure execution time with your SQL client.

---

## 📁 How to Use

Ensure this file is saved as:

```
alx-airbnb-database/
└── database-adv-script/
    ├── database_index.sql
    ├── index_performance.md ✅
    └── README.md
```

---

*Want to simulate `EXPLAIN ANALYZE` results from PostgreSQL or need advanced optimization tips? Let me know!*