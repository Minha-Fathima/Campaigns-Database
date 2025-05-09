# Advertising Campaign Database System (MariaDB)

This project is a **relational database management system** designed to manage advertising campaigns across various media types. Developed using **MariaDB**, it covers everything from entity-relationship modeling to schema implementation and indexing for optimized performance.


---

## Project Overview

This system models relationships between clients, departments, employees, campaigns, invoices, and advertisements (TV, Magazine, Website, and Radio). It supports:
- Generalization/specialization
- Ternary and recursive relationships
- Weak entities
- Multivalued attributes
- Many-to-many relationships via associative entities

---

## Technologies Used

- MariaDB (SQL)
- Entity Relationship Diagram (ERD)
- Data Dictionary
- SQL Schema with Constraints
- Indexing for Optimization

---

## 🧱 Core Components

### 1. Entity-Relationship Model
- Includes entities like `Employee`, `Client`, `Campaign`, etc.
- Recursive relationship for supervisors
- Weak entities like `CampaignDate`
- Multivalued attributes via separate tables

### 2. Relational Schema
- Defined with primary and foreign keys
- Composite keys for associative relationships (`WorksOn`, `Charges`, etc.)
- Auto-incremented keys for unique identification

### 3. MariaDB Implementation
- Full DDL with foreign key constraints and cascading rules
- Separate `.sql` file for schema execution
- Comments to explain design decisions

### 4. Indexing
Indexes implemented on frequently queried fields:
- `Employee(firstName, lastName)`
- `Department(depName)` – with `UNIQUE`
- `Client(clientName)`
- `Campaign(campName)` – with `UNIQUE`
- `Invoice(iCampID)`

---

## Team Contributions

- **Minha Fathima Avoor**: ER diagram, relational schema, MariaDB code, indexing, report review  
- **Nur Shahira Sharizan**: ER diagram, commenting on MariaDB  
- **Leelian Alhadhoud**: ER diagram, relational schema, MariaDB comments  
- **Eman Iftikhar**: Schema description, indexing, formatting  
- **Sibila Shihab**: Majority of MariaDB code, data dictionary  
- **Kanana Muchiri**: ER descriptions, schema, indexing  

