-- =====================================================
-- INDEXING PRACTICE
-- =====================================================

-- Indexing is used to improve the speed of data
-- retrieval from a table.

-- An index is like the index at the back of a textbook.
-- Instead of reading every page to find the word
-- "Recursion", you look at the index, find Recursion
-- and directly go to the required page.


-- =====================================================
-- 1. CREATE DATABASE
-- =====================================================

create database newdb2;

use newdb2;


-- =====================================================
-- 2. DROP TABLE
-- =====================================================

-- Dropping the table if it already exists.

drop table if exists test;


-- =====================================================
-- 3. CREATE TEST TABLE
-- =====================================================

create table test (
    id int,
    name varchar(20)
);


-- =====================================================
-- 4. INSERT DATA
-- =====================================================

insert into test
values
(1, 'a'),
(3, 'b'),
(2, 'c'),
(5, 'd'),
(4, 'e'),
(6, 'd'),
(7, 'd');


-- =====================================================
-- 5. CHECK DATA
-- =====================================================

select *
from test;


-- =====================================================
-- 6. EXPLAIN - BEFORE INDEX
-- =====================================================

-- EXPLAIN shows how MySQL plans to execute the query.
-- At this point, there is no index on id.

explain
select *
from test
where id = 3;


-- =====================================================
-- 7. B-TREE INDEX
-- =====================================================

-- B-Tree is a balanced tree data structure.
-- It is commonly used by MySQL for indexes.
-- It helps MySQL find rows efficiently without
-- scanning the entire table in many cases.


-- =====================================================
-- 8. PRIMARY KEY & CLUSTERED INDEX
-- =====================================================

-- In InnoDB, the PRIMARY KEY is used as the
-- clustered index.
-- The table data is organized according to
-- the primary key.

alter table test
add primary key (id);

desc test;

select *
from test;


-- =====================================================
-- 9. EXPLAIN - SEARCHING BY NAME
-- =====================================================

-- There is no separate index on name yet.

explain
select *
from test
where name = 'a';


-- =====================================================
-- 10. NAME INDEX
-- =====================================================

-- The duplicate 'd' values were inserted above
-- intentionally for demonstrating index behaviour.

create index name_index
on test(name);


-- =====================================================
-- 11. SHOW INDEXES
-- =====================================================

show indexes
from test;


-- =====================================================
-- 12. SEARCH USING NAME INDEX
-- =====================================================

select *
from test
where name = 'a';


-- EXPLAIN can be used to check whether MySQL
-- chooses the name_index for this query.

explain
select *
from test
where name = 'd';


-- =====================================================
-- 13. COMPOSITE INDEX
-- =====================================================

-- Creating a students table for composite index practice.

create table students (
    id int,
    name varchar(50),
    age int
);


-- =====================================================
-- 14. INSERT STUDENT DATA
-- =====================================================

insert into students
values
(1, 'r', 21),
(2, 'a', 24),
(3, 'p', 22),
(4, 'n', 25);


-- =====================================================
-- 15. CREATE COMPOSITE INDEX
-- =====================================================

-- A composite index is an index created on
-- more than one column.

create index idx_name_age
on students(name, age);


-- =====================================================
-- 16. COMPOSITE INDEX - NAME
-- =====================================================

-- 'name' is the first column of the composite index.
-- Therefore, MySQL can use the index for searching
-- by name.

explain
select *
from students
where name = 'r';


-- =====================================================
-- 17. COMPOSITE INDEX - AGE
-- =====================================================

-- 'age' is the second column of the composite index.
-- Because name is not included in the condition,
-- this query generally cannot use the composite index
-- efficiently through its leftmost column rule.

explain
select *
from students
where age = 21;


-- =====================================================
-- IMPORTANT CONCEPTS
-- =====================================================

-- 1. Index
-- 2. B-Tree
-- 3. Primary Key
-- 4. Clustered Index
-- 5. Non-Clustered / Secondary Index
-- 6. Composite Index
-- 7. EXPLAIN
-- 8. Leftmost Prefix Rule
-- 9. SHOW INDEXES
-- 10. Index advantages and disadvantages


-- =====================================================
-- END OF INDEXING PRACTICE
-- =====================================================