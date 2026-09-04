# SQL Indexing Practice

This repository contains my MySQL practice queries based on database indexing and query performance.

## SQL Topics Covered

* Indexing
* B-Tree
* Primary Key
* Clustered Index
* Secondary Index
* Composite Index
* EXPLAIN
* SHOW INDEXES
* Leftmost Prefix Rule

## Indexing

An index helps improve the speed of data retrieval from a table.

An index can be compared to the index at the back of a textbook. Instead of checking every page to find a topic, the index helps locate it quickly.

## B-Tree

B-Tree is a balanced tree data structure commonly used for database indexes.

It helps the database find records efficiently without scanning the entire table in many situations.

## Primary Key and Clustered Index

In MySQL InnoDB, the PRIMARY KEY acts as the clustered index.

The table data is organized according to the primary key.

## Secondary Index

A secondary index is created separately from the primary key.

Example:

`CREATE INDEX name_index ON test(name);`

## Composite Index

A composite index is an index created on multiple columns.

Example:

`CREATE INDEX idx_name_age ON students(name, age);`

The order of columns in a composite index is important because of the leftmost prefix rule.

## EXPLAIN

The `EXPLAIN` statement is used to understand how MySQL plans to execute a query.

It can help identify whether an index is being considered or used.

## Tools Used

* MySQL
* MySQL Workbench
* GitHub

## Purpose

This repository is part of my SQL learning and practice journey. It demonstrates my understanding of database indexing, B-Tree indexes, primary keys, composite indexes and query execution plans.
